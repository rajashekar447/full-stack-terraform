variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "my_ip" {
  description = "Your public IP in CIDR format"
  type        = string
}

variable "key_name" {
  description = "Existing EC2 key pair name"
  type        = string
}

variable "db_username" {
  description = "RDS username"
  type        = string
  default     = "appuser"
}

variable "db_password" {
  description = "RDS password"
  type        = string
  sensitive   = true
}
