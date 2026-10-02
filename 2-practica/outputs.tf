output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IP assigned to the instance"
  value       = aws_instance.web.public_ip
}

output "service_url" {
  description = "URL of the exposed service"
  value       = "http://${aws_instance.web.public_dns}"
}
