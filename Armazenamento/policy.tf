resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket-neto-teste.id
  
  policy = jsonencode({
    "Version": "2008-10-17",
    "Statement": [
      {
        "Effect": "Deny",
        "Principal": "*",
        "Action": "s3:*",
        "Resource": [
          "arn:aws:s3:::${aws_s3_bucket.bucket-neto-teste.id}"
        ],
        "Condition": {
          "Bool": {
            "aws:SecureTransport": "false"
          }
        }
      }
    ]
  })
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket-neto-teste.id
  acl    = "private" 
}

resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
  bucket = aws_s3_bucket.bucket-neto-teste.id

  rule {
    object_ownership = "ObjectWriter"
  }
}
