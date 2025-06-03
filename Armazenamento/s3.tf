resource "aws_s3_bucket" "bucket-neto-teste" {
  bucket = var.bucket_name

  tags = { Name = "Neto Bucket" }
}
