//Codigo de crash intencional para teste da ferramenta tfsec
//Cria um bucket S3 com ACL pública, o que é uma má prática de segurança
resource "aws_s3_bucket_acl" "insecure_bucket_acl" {
  bucket = "tfsec-insecure-bucket-example-123456"
  acl    = "public-read"
}
