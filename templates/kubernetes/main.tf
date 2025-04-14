terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.33.0"
    }
  }
}



module "environment" {
  source = "./environment"
  providers = {
    kubernetes.environment = kubernetes
  }
  depends_on = [module.namespaces]
  env_vars   = var.env_vars
}

module "postgresql_database" {
  source = "../modules/databases/postgresql/deployment"
  providers = {
    kubernetes = kubernetes
  }
  depends_on = [module.environment]
}

module "mongo_database" {
  source = "../modules/databases/mongodb/deployment"
  providers = {
    kubernetes = kubernetes
  }
  depends_on = [module.environment]
}

module "hexagonal_template" {
  source = "git::https://github.com/luisLlanos23/Hexagonal-Achitectural.git//manifests/deployment"
  providers = {
    kubernetes = kubernetes
  }
  depends_on = [
    module.environment,
    module.postgresql_database,
    module.mongo_database
  ]
  env_vars   = var.env_vars
}

module "nesjs_template" {
  source = "git::https://github.com/luisLlanos23/nestjs-template.git//manifests/deployment"
  providers = {
    kubernetes = kubernetes
  }
  depends_on = [module.environment, module.postgresql_database]
  env_vars   = var.env_vars
}

module "networking" {
  source = "./networking"
  providers = {
    kubernetes.networking  = kubernetes
    kubernetes.environment = kubernetes
  }
  depends_on = [module.namespaces]
}

module "namespaces" {
  source = "../modules/namespaces"
  providers = {
    kubernetes = kubernetes
  }
  namespaces = ["templates"]
}