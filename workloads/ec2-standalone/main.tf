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
  source           = "../../modules/cell"
  
  sg_name          = "dummy-cell-sg"
  sg_description   = "Allow HTTP inbound traffic"
  sg_ingress_rules = [
    {
      from_port    = 80
      to_port      = 80
      protocol     = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]
    },
    {
      from_port    = 22
      to_port      = 22
      protocol     = "tcp"
      cidr_blocks  = ["3.0.5.32/29"]
    }
  ]
  sg_egress_rules  = [
    {
      from_port    = 0
      to_port      = 0
      protocol     = "-1"
      cidr_blocks  = ["0.0.0.0/0"]
    }
  ]
  sg_tags = {
    Name           = "dummy-cell-sg"
  }

  ec2_ami          = "ami-0b287aaaab87c114d"
  ec2_tags         = {
    Name           = "CellInstance1"
  }
  user_data        = <<-EOF
                      #!/bin/bash
                      yum update -y
                      yum install -y httpd
                      systemctl start httpd
                      systemctl enable httpd
                      echo "<html><h1>Hello, World from $(hostname -f)!</h1></html>" > /var/www/html/index.html
                    EOF
}

output "instance_id" {
  value = module.cell.ec2_instance.instance_id
}

output "public_ip" {
  value = module.cell.ec2_instance.public_ip
}

output "security_group_id" {
  value = module.cell.security_group.security_group_id
}