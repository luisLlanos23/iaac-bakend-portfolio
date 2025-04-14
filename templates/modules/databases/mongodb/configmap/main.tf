resource "kubernetes_config_map_v1" "mongodb_config_map" {
  metadata {
    name      = "mongodb"
    namespace = "templates"
  }

  data = {
    "init-mongo" = <<-EOT
    #!/bin/bash
    mongo <<EOF
    use bim_inspector
    db.createCollection("dummy_collection")
    use process_manager
    db.createCollection("dummy_collection")
    EOF
    EOT
  }
}