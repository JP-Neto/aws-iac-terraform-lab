variable "managed-by" {
  type        = string
  description = "Administrado por"
}

variable "region" {
  type        = string
  description = "Região"
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
variable "azs" {
  type        = list(string)
  description = "Lista de azs"
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
  description = "id da VPC"
}
