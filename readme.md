# Terraform SecDevOps Pipeline

## Visão Geral
Este projeto demonstra a implementação de uma **pipeline de CI/CD com foco em segurança (SecDevOps)** para código Terraform utilizando **GitHub Actions**.

O objetivo é garantir que alterações de infraestrutura passem por **validação, padronização e análise de segurança automática** antes de qualquer possibilidade de deploy, aplicando o conceito de *shift-left security*.

Este repositório foi desenvolvido para fins de **aprendizado prático** e **portfólio**.

---

## Tecnologias Utilizadas
- Terraform
- GitHub Actions
- tfsec (ferramenta open source para análise de segurança em Terraform)
- AWS (apenas como provider de referência)

---

## Pipeline de CI/CD
A pipeline é executada automaticamente a cada push ou pull request e contém as seguintes etapas:

1. **Terraform Init**
2. **Terraform Format Check (`terraform fmt -check`)**
3. **Terraform Validate**
4. **Análise de segurança com tfsec**

A pipeline falha automaticamente caso:
- O código Terraform não esteja formatado corretamente
- A configuração seja inválida
- Sejam detectadas falhas de segurança na infraestrutura

---

## Segurança (SecDevOps)
A segurança é integrada diretamente ao pipeline.

Durante o desenvolvimento deste projeto:
- Configurações inseguras (ex: bucket S3 público) foram propositalmente introduzidas
- O tfsec identificou as vulnerabilidades e bloqueou a pipeline
- As falhas foram corrigidas seguindo boas práticas de segurança
- A pipeline voltou a executar com sucesso

Esse fluxo simula como a segurança deve atuar em ambientes reais de CI/CD.

---

## Execução Local 
```bash
cd terraform
terraform init
terraform validate

```
---
## Estrutura do Repositório
```
.
├── terraform/
│   ├── main.tf
│   ├── providers.tf
│   ├── s3.tf
│   └── variables.tf
└── .github/
    └── workflows/
        └── terraform-security.yml

```