terraform {
  required_providers {
    aws       = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "mark-dev-cec-tfstate"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
    # dynamodb_table = "mark-dev-cec-tflock"
  }
}

provider "aws" {
  region = var.region
}

module "cell" {
  source                = "../../modules/cell"

  sg_name               = "dummy-cell-sg"
  sg_description        = "Allow HTTP inbound traffic"
  sg_ingress_rules      = [
    {
      from_port         = 80
      to_port           = 80
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
    },
    {
      from_port         = 22
      to_port           = 22
      protocol          = "tcp"
      cidr_blocks       = ["3.0.5.32/29"]
    }
  ]
  sg_egress_rules       = [
    {
      from_port         = 0
      to_port           = 0
      protocol          = "-1"
      cidr_blocks       = ["0.0.0.0/0"]
    }
  ]
  sg_tags               = {
    Name                = "dummy-cell-sg"
  }

  lg_name               = "dev-dummy-cell-lunch-config"

  asg_name              = "dev-dummy-cell-asg"
  asg_ami_id            = "ami-0b287aaaab87c114d"
  asg_user_data         = <<-EOF
                      #!/bin/bash
                      yum update -y
                      yum install -y httpd
                      systemctl start httpd
                      systemctl enable httpd
                      echo "<html><h1>Hello, World from $(hostname -f)!</h1></html>" > /var/www/html/index.html
                    EOF
  asg_min_size          = 3
  asg_max_size          = 5
  asg_desired_capacity  = 3

  tg_name               = "dev-dummy-cell-tg"
  alb_name              = "dev-dummy-cell-alb"
}

output "dns_name" {
  value = module.cell.dns_name
}