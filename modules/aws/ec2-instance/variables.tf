variable "ami" {
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

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "User data to configure the instance at launch"
  type        = string
  default     = ""
}