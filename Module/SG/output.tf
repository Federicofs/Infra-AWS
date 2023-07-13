output "security_group_public_id" {
    value = aws_security_group.public.id
}

output "security_gropus_private_id" {
    value = aws_security_group.private.id
}
