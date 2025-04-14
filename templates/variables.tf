variable "deploy_type" {
  type        = string
  description = "The type of deployment. Can be 'kubernetes' or 'docker'."
  default     = "kubernetes"
}

variable "environment" {
  type        = string
  description = "The environment to deploy the application. Possible values: development, staging, production"
}

variable "env_vars" {
  type        = map(any)
  description = "The hole set of environment varaibles for bimep. Base in the components you will deploy"
}