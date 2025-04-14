variable "env_vars" {
  type        = map(any)
  description = "The hole set of environment varaibles for bimep. Base in the components you will deploy"
}

variable "environment" {
  type        = string
  description = "The environment to deploy the application. Possible values: development, staging, production"
}

variable "deploy_type" {
  type        = string
  description = "The deploy type to deploy the application. Possible values: development, staging, production"
}

variable "kubernetes_host" {
  type        = string
  description = <<EOT
    The host url where the controls node exists. This can be getted using "kubectl config view"
  EOT
}