terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.33.0"
    }
  }
}

resource "kubernetes_namespace_v1" "kubernetes_temaplate_namespace" {
  count                            = try(index(var.namespaces, "templates") >= 0 ? 1 : 0, 0)
  wait_for_default_service_account = true
  metadata {
    name = "templates"
  }
}