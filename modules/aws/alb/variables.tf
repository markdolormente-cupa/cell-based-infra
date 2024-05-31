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

variable "tg_vpc_id" {
  description = "VPC ID where the target group is created"
  type        = string
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

variable "alb_security_group_ids" {
  description = "List of security group IDs to assign to the load balancer"
  type        = list(string)
}

variable "alb_subnet_ids" {
  description = "List of subnet IDs to attach to the load balancer"
  type        = list(string)
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