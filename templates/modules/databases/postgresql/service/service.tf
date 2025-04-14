resource "kubernetes_service_v1" "postgresql_service" {
  metadata {
    name      = "postgresql"
    namespace = "templates"
  }
  spec {
    selector = {
      app = "postgresql"
    }
    type             = "NodePort"
    session_affinity = "None"
    session_affinity_config {
      client_ip {
        timeout_seconds = 10800
      }
    }
    port {
      port      = 5432
      node_port = 30000
      protocol  = "TCP"
    }
  }
}