terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.59.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Managed-by = var.managed-by
    }
  }
}

module "conectividade" {
  source       = "./Conectividade"
  region       = var.region
  managed-by   = var.managed-by
  vpcPrincipal = var.vpcPrincipal
  subnetDmz    = var.subnetDmz
  subnetApp    = var.subnetApp
  subnetBd     = var.subnetBd
  azs          = var.azs
  cidr_dmz     = var.cidr_dmz
}

module "aplicacao" {
  source            = "./Aplicacao"
  region            = var.region
  managed-by        = var.managed-by
  instance_type     = var.instance_type
  ami-linux         = var.ami-linux
  ami-win           = var.ami-win
  azs               = var.azs
  aws-key           = var.aws-key
  IpDmzFixo         = var.IpDmzFixo
  instances_count   = var.instances_count
  subnetPublicId    = module.conectividade.public_subnet_id
  segGroupPublicId  = module.conectividade.public_Sg_id
  subnetPrivateIds  = module.conectividade.private_subnet_ids
  segGroupPrivateId = module.conectividade.private_Sg_ids
  vpc_id            = module.conectividade.vpc_id


}

# module "Armazenamento" {
#   source           = "./Armazenamento"
#   bucket_name      = var.bucket_name
#   subnetPrivateIds = module.conectividade.private_subnet_ids
# }


