
resource "kubernetes_deployment_v1" "mongodb_deployment" {
  timeouts {
    create = "3m"
    update = "3m"
    delete = "3m"
  }
  metadata {
    name      = "mongodb"
    namespace = "templates"
    labels = {
      app = "mongodb"
    }
  }

  spec {
    revision_history_limit = 5

    selector {
      match_labels = {
        app = "mongodb"
      }
    }

    template {
      metadata {
        labels = {
          app = "mongodb"
        }
      }

      spec {
        container {
          name              = "mongodb"
          image             = "mongo:latest"
          image_pull_policy = "Always"

          env_from {
            config_map_ref {
              name = "mongodb"
            }
          }
          volume_mount {
            name       = "init-mongo"
            mount_path = "/docker-entrypoint-init.d"
          }
          port {
            container_port = 27017
            name           = "mongodb"
            protocol       = "TCP"
          }
        }
        volume {
          name = "init-mongo"
          config_map {
            name = "mongodb"
          }
        }
      }
    }
  }
}