# variable.tfvar > mian.tf > module

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = var.name_vpc
  cidr = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]  #cambiar a variable 
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"] #cambiar a variable 
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"] #cambiar a variable 

  enable_vpn_gateway = true #permite que las subnet privadas vayan a internet para responder peticiones o actulizar los nodos
  enable_nat_gateway = true #crea nat_gateway en todas las subnet privadas para alta disponibilidad
  single_nat_gateway = true
  create_igw         = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform = "true"  # a variable 
    Environment = "dev" # a variable 
  }
}