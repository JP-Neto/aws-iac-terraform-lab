output "public_subnet_id" {
  value = aws_subnet.DMZ.id

}

output "public_Sg_id" {
  description = "Subnet Public Id"
  value       = aws_security_group.sgDmz.id
}

output "private_Sg_ids" {
  description = "Security Group Private Ids"
  value = [
    aws_security_group.sgApp.id,
    aws_security_group.sgBd.id,
    aws_security_group.sgAlb.id
  ]
}

output "private_subnet_ids" {
  description = "Subnet Private Ids"
  value = [
    aws_subnet.APP.id,
    aws_subnet.BD.id
  ]
}

output "vpc_id" {
  description = "Id da vpc Principal"
  value       = aws_vpc.vpc-east.id

}