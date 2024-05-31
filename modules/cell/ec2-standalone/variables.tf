variable "sg_name" {
  description = "The name of the security group"
  type        = string
}

variable "sg_description" {
  description = "The description of the security group"
  type        = string
}

variable "sg_vpc_id" {
  description = "The VPC ID to create the security group in"
  type        = string
  default     = ""
}

variable "sg_ingress_rules" {
  description = "A list of ingress rules"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default     = []
}

variable "sg_egress_rules" {
  description = "A list of egress rules"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default     = []
}

variable "sg_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default    = {}
}

variable "ec2_ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.micro"
}

variable "ec2_security_group_ids" {
  description = "The instance security group id"
  type        = list(string)
  default     = []
}

variable "ec2_tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "User data to configure the instance at launch"
  type        = string
  default     = ""
}







