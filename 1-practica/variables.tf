variable "aws_region" {
  description = "AWS region where the bucket is created"
  type        = string
  default     = "us-east-1"
}

variable "bucket_prefix" {
  description = "Prefix for the bucket name; AWS appends a random suffix to keep it globally unique"
  type        = string
  default     = "cloudcamp-practica-"
}
