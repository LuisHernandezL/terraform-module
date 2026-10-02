resource "aws_s3_bucket" "practica" {
  bucket_prefix = var.bucket_prefix

  tags = {
    Name        = "cloudcamp-practica"
    Environment = "Dev"
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "practica" {
  bucket = aws_s3_bucket.practica.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
