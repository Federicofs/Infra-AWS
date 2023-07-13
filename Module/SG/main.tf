## public sg

resource "aws_security_group" "public" {
    name        = "${var.sg_name}_public_rule"
    vpc_id      = var.vpc_id

    tags = {
        Name = "sg_public" 
        Environment = "dev"
    }
}

resource "aws_security_group_rule" "public_out" {
    type             = "egress"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

    security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "ssh" {
    type              = "ingress"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
    security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "http" {
    type              = "ingress"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

    security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "https" {
    type              = "ingress"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
    security_group_id = aws_security_group.public.id
}

## private sg

resource "aws_security_group" "private" {
    name        = "${var.sg_name}_private_rule"
    vpc_id      = var.vpc_id

    tags = {
        Name = "sg_private"
        Environment = "dev"
    }
}

resource "aws_security_group_rule" "private_out" {
    type             = "egress"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

    security_group_id = aws_security_group.private.id
}

resource "aws_security_group_rule" "private_in" {
    type             = "ingress"
    from_port        = 0
    to_port          = 65535
    protocol         = "-1"
    cidr_blocks      = [var.vpc_cidr]
    
    security_group_id = aws_security_group.private.id
}
