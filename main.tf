terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.33.0"
    }
  }
}

provider "kubernetes" {
  config_path = local.kubernetes_config_path
  host        = var.kubernetes_host
  insecure = local.kubernetes_insecure
}

module "templates" {
  source = "./templates"
  providers = {
    kubernetes = kubernetes
  }
  deploy_type = var.deploy_type
  environment = var.environment
  env_vars    = var.env_vars
}