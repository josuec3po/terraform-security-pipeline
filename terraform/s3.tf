// Código de crash intencional para teste da ferramenta tfsec
// Cria um bucket S3 com ACL pública (má prática de segurança)
/*
resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "tfsec-insecure-bucket-example-123456"
}

resource "aws_s3_bucket_acl" "insecure_bucket_acl" {
  bucket = aws_s3_bucket.insecure_bucket.id
  acl    = "public-read"
}
*/

// Código corrigido seguindo boas práticas de segurança

resource "aws_s3_bucket" "secure_bucket" {
  bucket = "tfsec-secure-bucket-example-123456"
}

resource "aws_s3_bucket_versioning" "secure_versioning" {
  bucket = aws_s3_bucket.secure_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "secure_block" {
  bucket = aws_s3_bucket.secure_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_kms_key" "s3_key" {
  description             = "KMS key for S3 bucket encryption"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "secure_encryption" {
  bucket = aws_s3_bucket.secure_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.s3_key.arn
    }
  }
}
