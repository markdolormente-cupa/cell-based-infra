data "aws_vpc" "default" {
  default = true
}

module "security_group" {
  source        = "../aws/security_group"

  name          = var.sg_name
  description   = var.sg_description
  vpc_id        = var.sg_vpc_id == "" ? null : data.aws_vpc.default.id

  ingress_rules = var.sg_ingress_rules

  egress_rules  = var.sg_egress_rules

  tags          = var.sg_tags
}

module "ec2_instance" {
  source             = "../aws/ec2-instance"

  ami                = var.ec2_ami
  tags               = var.ec2_tags
  security_group_ids = concat([module.security_group.security_group_id], var.ec2_security_group_ids)
  user_data          = var.user_data

  depends_on         = [ module.security_group ]
}

output "ec2_instance" {
  value = module.ec2_instance
}

output "security_group" {
  value = module.security_group
}