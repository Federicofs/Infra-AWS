# variable.tfvar > mian.tf > module
# de aca se van a los modulos 
module "vpc_r" {
  source = "./module/VPC"

  name_vpc = var.base_vpc_name
  #tag
}

module "ec2_r" {
  source = "./module/EC2"

  ec2_name = var.base_ec2_name
  key_name = var.base_key_ec2
  user_data = file("./example.sh")
  # vpc_security_group_ids = [module.sg_r.security_group_public_id] # 80 ; 443
  #vpc output
  security_gropus_public_id = module.sg_r.security_group_public_id
  security_gropus_private_id = module.sg_r.security_gropus_private_id
  subnet_id = module.vpc_r.public_subnets[0]
  # tags 
}

#otro para el jenkns con 22
module "sg_r" {
  source = "./module/SG"
  
  sg_name = var.base_sg_name
  vpc_id = module.vpc_r.vpc_id
  vpc_cidr = module.vpc_r.vpc_cidr
  #tags
}