output "instance_1" {
  description = "IDs de todas as instâncias"
  value       = aws_instance.ec2_linux_az_1_neto[1].id

}