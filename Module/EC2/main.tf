module "ec2_instance" {
    source  = "terraform-aws-modules/ec2-instance/aws"
    version = "5.2.1"
  
    name = var.ec2_name
    ami = "ami-0557a15b87f6559cf"
    instance_type = "t2.micro"
    key_name = var.key_name
    user_data = var.user_data
  #sg
    vpc_security_group_ids = [var.security_gropus_public_id, var.security_gropus_private_id,]
  #vpc
    subnet_id = var.subnet_id
    associate_public_ip_address = true
    
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}