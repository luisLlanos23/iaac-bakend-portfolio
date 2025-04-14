resource "kubernetes_service_v1" "mongodb_service" {
  metadata {
    name      = "mongodb"
    namespace = "templates"
  }
  spec {
    selector = {
      app = "mongodb"
    }
    type             = "NodePort"
    session_affinity = "None"
    session_affinity_config {
      client_ip {
        timeout_seconds = 10800
      }
    }
    port {
      port      = 27017
      node_port = 30010
      protocol  = "TCP"
    }
  }
}