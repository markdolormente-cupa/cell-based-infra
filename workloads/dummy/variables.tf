variable "bucket" {
  description = "The bucket name for backend"
  type        = string
  default     = "mark-dev-cec-tfstate"
}

variable "key" {
  description = "The key for backend"
  type        = string
  default     = "terraform.tfstate"
}

variable "s3_region" {
  description = "The region for the backend"
  type        = string
  default     = "ap-southeast-1" 
}

variable "dynamodb_table" {
  description = "The DyanmoDB table name for the backend"
  type        = string
  default     = "mark-dev-cec-tflock" 
}

variable "region" {
  description = "The region for the where to deploy the resources"
  type        = string
  default     = "ap-southeast-1" 
}