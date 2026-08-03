# 1. Definição dos provedores de nuvem (Cloud Providers)
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# 2. Configuração da região da nuvem onde o projeto vai rodar
provider "aws" {
  region = "us-east-1" # Região padrão da Virgínia do Norte
}

# 3. Criação da Rede Isolada e Segura (VPC) para a Loja Veloz
resource "aws_vpc" "veloz_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name        = "vpc-loja-veloz"
    Environment = "Production"
  }
}

# 4. Esqueleto do Cluster Kubernetes Automatizado (EKS)
resource "aws_eks_cluster" "veloz_kubernetes" {
  name     = "eks-cluster-pedidos-veloz"
  role_arn = "arn:aws:iam::123456789012:role/EKSClusterRole-Ficticia"

  vpc_config {
    # Garante que o cluster vai rodar dentro da rede que criamos acima
    subnet_ids = ["subnet-12345", "subnet-67890"]
  }

  tags = {
    Deployment = "Terraform-IaC"
  }
}
