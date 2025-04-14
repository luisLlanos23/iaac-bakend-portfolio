resource "kubernetes_config_map_v1" "postgresql_config_map" {
  metadata {
    namespace = "templates"
    name      = "postgresql"
  }

  data = {
    "init-sql"        = <<-EOT
      CREATE DATABASE ${var.env_vars.DATABASE_NAME};
      CREATE USER test WITH ENCRYPTED PASSWORD '${var.env_vars.DATABASE_PASSWORD}';
      GRANT ALL PRIVILEGES ON DATABASE ${var.env_vars.DATABASE_NAME} TO ${var.env_vars.DATABASE_USER};
  EOT
    POSTGRES_USER     = "${var.env_vars.DATABASE_USER}"
    POSTGRES_PASSWORD = "${var.env_vars.DATABASE_PASSWORD}"
  }
}

