output "bucket_name" {
  description = "Generated bucket name"
  value       = aws_s3_bucket.practica.id
}

output "bucket_arn" {
  description = "Bucket ARN"
  value       = aws_s3_bucket.practica.arn
}

output "bucket_region" {
  description = "Region where the bucket lives"
  value       = aws_s3_bucket.practica.region
}
