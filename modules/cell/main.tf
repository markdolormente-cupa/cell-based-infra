data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "security_group" {
  source = "../aws/security-group"

  name        = var.sg_name
  description = var.sg_description
  vpc_id      = data.aws_vpc.default.id

  ingress_rules = var.sg_ingress_rules

  egress_rules = var.sg_egress_rules

  tags = var.sg_tags
}

module "alb" {
  source = "../aws/alb"

  tg_name                             = var.tg_name
  tg_port                             = var.tg_port
  tg_protocol                         = var.tg_protocol
  tg_vpc_id                           = data.aws_vpc.default.id
  tg_health_check_path                = var.tg_health_check_path
  tg_health_check_interval            = var.tg_health_check_interval
  tg_health_check_timeout             = var.tg_health_check_timeout
  tg_health_check_unhealthy_threshold = var.tg_health_check_unhealthy_threshold
  tg_health_check_matcher             = var.tg_health_check_matcher

  alb_name               = var.alb_name
  alb_internal           = var.alb_internal
  alb_subnet_ids         = data.aws_subnets.default.ids
  alb_security_group_ids = [module.security_group.id]

  listener_port     = var.listener_port
  listener_protocol = var.listener_protocol

  depends_on = [module.security_group]
}

module "asg" {
  source = "../aws/asg"

  lg_name            = var.lg_name
  name               = var.asg_name
  ami_id             = var.asg_ami_id
  user_data          = var.asg_user_data
  min_size           = var.asg_min_size
  max_size           = var.asg_max_size
  desired_capacity   = var.asg_desired_capacity
  subnet_ids         = data.aws_subnets.default.ids
  security_group_ids = [module.security_group.id]
  target_group_arns  = [module.alb.tg_arn]

  depends_on = [module.alb, module.security_group]
}

output "dns_name" {
  value = module.alb.dns_name
}