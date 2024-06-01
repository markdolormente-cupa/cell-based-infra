resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  user_data              = var.user_data
  tags                   = var.tags
  vpc_security_group_ids = var.security_group_ids
}