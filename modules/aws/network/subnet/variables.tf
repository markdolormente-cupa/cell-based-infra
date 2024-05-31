variable "vpc_id" {
  description = "The VPC ID for the subnet"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "The az for the subnet"
  type        = string
}

variable "name" {
  description = "The name tag for the subnet"
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Should be true if instances launched into the subnet should be assigned a public IP address"
  type        = bool
  default     = true
}