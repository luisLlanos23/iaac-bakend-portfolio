terraform {
  required_providers {
    kubernetes = {
      source                = "hashicorp/kubernetes"
      version               = "2.33.0"
      configuration_aliases = [kubernetes.environment]
    }
  }
}

module "postgresql_database_config_map" {
  source   = "../../modules/databases/postgresql/configmap"
  env_vars = var.env_vars
}

module "mongo_database_config_map" {
  source   = "../../modules/databases/mongodb/configmap"
}

module "hexagonal_temaplate_config_map" {
  source = "git::https://github.com/luisLlanos23/Hexagonal-Achitectural.git//manifests/configmap"
}

module "nestjs_temaplate_config_map" {
  source = "git::https://github.com/luisLlanos23/nestjs-template.git//manifests/configmap"
  env_vars = var.env_vars
}