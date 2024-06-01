variable "name" {
  description = "The name for asg"
  type        = string
}

variable "lg_name" {
  description = "The name for launch configuration"
  type        = string
  default     = ""
}

variable "ami_id" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.micro"
}

variable "security_group_ids" {
  description = "The instance security group id"
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = "User data to configure the instance at launch"
  type        = string
  default     = ""
}

variable "min_size" {
  description = "Min Size of instances"
  type        = number
  default     = 0
}

variable "max_size" {
  description = "Max Size of instances"
  type        = number
  default     = 0
}

variable "desired_capacity" {
  description = "Desired capacity of instances"
  type        = number
  default     = 0
}

variable "subnet_ids" {
  description = "Desired capacity of instances"
  type        = set(string)
  default     = []
}

variable "target_group_arns" {
  description = "Target group assigned to asg"
  type        = set(string)
  default     = []
}

