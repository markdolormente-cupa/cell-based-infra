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

variable "asg_name" {
  description = "The name for asg"
  type        = string
}

variable "lg_name" {
  description = "The name for launch configuration"
  type        = string
  default      = ""
}

variable "asg_ami_id" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "asg_instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.micro"
}

variable "asg_user_data" {
  description = "User data to configure the instance at launch"
  type        = string
  default     = ""
}

variable "asg_min_size" {
  description = "Min Size of instances"
  type        = number
  default     = 0
}

variable "asg_max_size" {
  description = "Max Size of instances"
  type        = number
  default     = 0
}

variable "asg_desired_capacity" {
  description = "Desired capacity of instances"
  type        = number
  default     = 0
}

variable "tg_name" {
  description = "Name of the target group"
  type        = string
}

variable "tg_port" {
  description = "Port on which the target group listens"
  type        = number
  default     = 80
}

variable "tg_protocol" {
  description = "Protocol used by the target group (e.g., HTTP, HTTPS)"
  type        = string
  default     = "HTTP"
}

variable "tg_health_check_path" {
  description = "Path for the health check endpoint"
  type        = string
  default     = "/"
}

variable "tg_health_check_interval" {
  description = "Time between health checks in seconds"
  type        = number
  default     = 30
}

variable "tg_health_check_timeout" {
  description = "Health check timeout in seconds"
  type        = number
  default     = 5
}

variable "tg_health_check_healthy_threshold" {
  description = "Number of consecutive successful health checks required before considering the target healthy"
  type        = number
  default     = 5
}

variable "tg_health_check_unhealthy_threshold" {
  description = "Number of consecutive failed health checks required before considering the target unhealthy"
  type        = number
  default     = 2
}

variable "tg_health_check_matcher" {
  description = "HTTP response code to use when checking for a healthy response from a target"
  type        = string
  default     = "200"
}

variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "alb_internal" {
  description = "Whether the load balancer is internal"
  type        = bool
  default     = false
}

variable "listener_port" {
  description = "Port on which the listener listens"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "Protocol for the listener (e.g., HTTP, HTTPS)"
  type        = string
  default     = "HTTP"
}

