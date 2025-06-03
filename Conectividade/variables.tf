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
