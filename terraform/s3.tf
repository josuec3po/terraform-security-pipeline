//Codigo de crash intencional para teste da ferramenta tfsec
//Cria um bucket S3 com ACL pública, o que é uma má prática de segurança
/*
resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "tfsec-insecure-bucket-example-123456"
}

resource "aws_s3_bucket_acl" "insecure_bucket_acl" {
  bucket = aws_s3_bucket.insecure_bucket.id
  acl    = "public-read"
}
*/

//Codigo corrigido para seguir boas práticas de segurança
//Cria um bucket S3 com bloqueio de acesso público
resource "aws_s3_bucket" "secure_bucket" {
  bucket = "tfsec-secure-bucket-example-123456"
}

resource "aws_s3_bucket_public_access_block" "secure_block" {
  bucket = aws_s3_bucket.secure_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
