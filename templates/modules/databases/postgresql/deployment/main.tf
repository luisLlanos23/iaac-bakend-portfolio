
resource "kubernetes_deployment_v1" "postgresql_deployment" {
  timeouts {
    create = "3m"
    update = "3m"
    delete = "3m"
  }
  metadata {
    name      = "postgresql"
    namespace = "templates"
    labels = {
      app = "postgresql"
    }
  }

  spec {
    revision_history_limit = 5

    selector {
      match_labels = {
        app = "postgresql"
      }
    }

    template {
      metadata {
        labels = {
          app = "postgresql"
        }
      }

      spec {
        container {
          name              = "postgres"
          image             = "postgres:14"
          image_pull_policy = "Always"

          env_from {
            config_map_ref {
              name = "postgresql"
            }
          }
          volume_mount {
            name       = "init-sql"
            mount_path = "/docker-entrypoint-init.d"
          }
          port {
            container_port = 5432
          }
        }
        volume {
          name = "init-sql"
          config_map {
            name = "postgresql"
          }
        }
      }
    }
  }
}