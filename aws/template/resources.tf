resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = false
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_bucket_logging" "main" {
  count = var.enable_bucket_logging ? 1 : 0

  bucket = aws_s3_bucket.main.id

  target_bucket = aws_s3_bucket.main.id
  target_prefix = "access-logs/"
}
