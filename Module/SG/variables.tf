variable "sg_name" {    
    description = "Name security gruops"
    type = string
}
variable "vpc_id" {
    description="The VPC Subnet ID to launch in"
    type=string
}

variable "vpc_cidr" {
    description="IP range value"
    type=string
}
