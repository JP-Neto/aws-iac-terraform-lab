variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string

}

variable "subnetPrivateIds" {
  type        = list(string)
  description = "subnet Private Id"

}
