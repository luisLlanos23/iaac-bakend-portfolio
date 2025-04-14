terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.33.0"
    }
  }
}

module "name" {
  count  = var.deploy_type == "kubernetes" ? 1 : 0
  source = "./kubernetes"
  providers = {
    kubernetes = kubernetes
  }
  environment = var.environment
  # deploy_type = var.deploy_type
  env_vars = var.env_vars
}