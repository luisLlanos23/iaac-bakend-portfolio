variable "namespaces" {
  type        = list(string)
  description = <<EOT
    The namespaces to create in the target cluster.
    Possible values: development, staging, production
  EOT
}
