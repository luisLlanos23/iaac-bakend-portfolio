terraform {
  required_providers {
    kubernetes = {
      source                = "hashicorp/kubernetes"
      version               = "2.33.0"
      configuration_aliases = [kubernetes.environment]
    }
  }
}

module "postgresql_database_service" {
  source = "../../modules/databases/postgresql/service"
}

module "mongo_database_service" {
  source = "../../modules/databases/mongodb/service"
}

module "hexagonal_template_service" {
  source = "git::https://github.com/luisLlanos23/Hexagonal-Achitectural.git//manifests/service"
}

module "nesjs_template_service" {
  source = "git::https://github.com/luisLlanos23/nestjs-template.git//manifests/service"
}