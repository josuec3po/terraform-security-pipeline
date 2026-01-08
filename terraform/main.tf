
terraform {
  required_version = ">= 1.3.0"
}

// Não cria nada na cloud , serve só para o Terraform rodar sendo ideal para CI/CD e segurança
resource "null_resource" "example" { 
  provisioner "local-exec" {
    command = "echo Terraform Security Pipeline"
  }
}
