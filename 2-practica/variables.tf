variable "aws_region" {
  description = "AWS region where the instance is created"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "service_port" {
  description = "Port exposed to the internet"
  type        = number
  default     = 80
}
