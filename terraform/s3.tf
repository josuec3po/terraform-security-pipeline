//Codigo de crash intencional para teste da ferramenta tfsec
//Cria um bucket S3 com ACL pública, o que é uma má prática de segurança
resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "tfsec-insecure-bucket-example-123456"
}

resource "aws_s3_bucket_acl" "insecure_bucket_acl" {
  bucket = aws_s3_bucket.insecure_bucket.id
  acl    = "public-read"
}
