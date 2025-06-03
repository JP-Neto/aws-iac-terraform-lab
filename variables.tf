variable "managed-by" {
  type        = string
  description = "Administrado por"
}
variable "region" {
  type        = string
  description = "Região da Infraestutura"
}
variable "vpcPrincipal" {
  type        = string
  description = "Ciddr vpc Principal"
}
variable "subnetDmz" {
  type        = string
  description = "Subnet Dmz"
}
variable "subnetApp" {
  type        = string
  description = "Subnet App"

}
variable "subnetBd" {
  type        = string
  description = "Subnet BD"
}
variable "azs" {
  type        = list(string)
  description = "Zonas de disponibilidade"

}
variable "cidr_dmz" {
  type        = string
  description = "Ip de liberacao do dmz"
}
variable "aws-key" {
  type        = string
  description = "Chave pem"
}
variable "IpDmzFixo" {
  type        = string
  description = "Ip Fixo Dmz"
}
variable "instances_count" {
  type        = string
  description = "Contador de instancias"
}
variable "ami-linux" {
  type        = string
  description = "Ami Instance"
}
variable "ami-win" {
  type        = string
  description = "Ami Instance windowns"
}
variable "instance_type" {
  type        = string
  description = "Type instance"
}
variable "subnetPublicId" {
  type        = string
  description = "subnet Public Id"
}

variable "segGroupPublicId" {
  type        = string
  description = "Seg Group Public Id"
}

variable "subnetPrivateIds" {
  type        = list(string)
  description = "subnet Private Id"

}

variable "segGroupPrivateId" {
  type        = list(string)
  description = "Seg Group Private Id"

}

variable "vpc_id" {
  type        = string
  description = "Vpc ID"
}

variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string

}