variable "ec2_name" {
    description = "name of ec2"
    type = string
}
variable "key_name" {
    description = "name of key name"
    type = string
}
variable "user_data" {
    description = "file.sh"
    type = string
}
variable "security_gropus_public_id" {
    description = "rule security gruops"
    type = string
}
variable "security_gropus_private_id" {
    description = "rule security gruops"
    type = string
}
variable "subnet_id" {
    description = "The VPC Subnet ID to launch in"
    type = string
}