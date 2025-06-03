###################----------------Gerais---------------##############
managed-by = "Neto - Terraform"
region     = "us-east-1"
azs        = ["us-east-1a", "us-east-1b", "us-east-1c"]



###################----------------Conetividade---------------##############
vpcPrincipal = "172.16.0.0/16"      # Exemplo de CIDR privado
subnetDmz    = "172.16.1.0/24"
subnetApp    = "172.16.2.0/24"
subnetBd     = "172.16.3.0/24"
cidr_dmz     = "0.0.0.0/0"


###################----------------Aplicacao----------------##############
instance_type     = "t2.micro"
ami-linux         = "ami-xxxxxxxxxxxxxxx"   # Substitua pela sua AMI pública
ami-win           = "ami-07d9456e59793a7d5" # Substitua pela sua AMI pública
aws-key           = "SuaChave"              # Nome da sua key pair, sem .pem
IpDmzFixo         = "172.16.1.182"          # IP fixo como exemplo
instances_count   = "2"
subnetPublicId    = null
segGroupPublicId  = null
subnetPrivateIds  = null
segGroupPrivateId = null
vpc_id            = null



###################----------------Armazenamento----------------##############
bucket_name = "bucket-cenario-neto-tf"