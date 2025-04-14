# Iaac-Bakend-Portfolio
## Infrastructure as code for backend server templates
This project uses Terraft to display my personal portfolio, where I present my work in various programming languages, frameworks, devote tools and databases. It is a practical exhibition of my technical skills and experience in development, operations and data management.

### Contact:
[![Linkedin](https://img.shields.io/badge/-LinkedIn-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/luis-alfonso-llanos-a64639206/) [![Github](https://img.shields.io/badge/-Github-000?style=flat&logo=Github&logoColor=white)](https://github.com/luisLlanos23)

### Repositories
- __Nestjs Template:__ https://github.com/luisLlanos23/nestjs-template
- __TypeScript Template:__ https://github.com/luisLlanos23/Hexagonal-Achitectural

### Pre Requirements
__Installation of Kubernetes__
- __Tutorial:__ https://microk8s.io/

__Terraform installation__
- __Tutorial:__ https://developer.hashicorp.com/terraform/install

### Variable configuration
Create terraform.tsvars file copying the following template
```
environment     = "templates"
deploy_type     = "kubernetes"
kubernetes_host = ""

env_vars = {
  DATABASE_NAME     = "test"
  DATABASE_USER     = "test"
  DATABASE_PASSWORD = "12345!"
  DATABASE_SCHEMA   = "public"
  RUN_MIGRATIONS    = "true"
  SECRET_TOKEN      = "12345"
}
```
__Note:__
- __kubernetes_host:__ It is the most port IP address of the configuration of kubernetes within the machine.

Command to get it:
```
  kubectl config view
```

### Deploy
- __init terraform:__
```
terraform init
```
- __Generate plan:__
```
terraform plan
```
- __Apply configuration:__
```
terraform apply
```
or
```
terraform apply --auto-approve
```
### Remove
- __Remove plan:__
```
terraform destroy
```
or
```
terraform destroy --auto-approve
```
__Note:__ The destroy using --auto-approve is not to ask and destroy the plan automatically
### Service Table
| Name                               | Type       | External-IP | Port(s)           | Age |
|------------------------------------|------------|-------------|-------------------|-----|
| postgresql                         | NodePort   | <none>      | 5432:30000/TCP    | 60s |
| mongodb                            | NodePort   | <none>      | 27017:30010/TCP   | 60s |
| hexagonal-architecture-expressjs   | NodePort   | <none>      | 4000:30020/TCP    | 60s |
| nestjs-template                    | NodePort   | <none>      | 4000:30030/TCP    | 60s |

__Note:__ Through port mapping, orchestrated resources can be accessed

__Example:__ http://host:externalPort

__Swagger Documentation__
- __Hexagonal_template:__ http://host:30020/docs/api
- __nestjs_template:__ http://host:30030/docs/api

__Database Connection__
- __PgAdmin:__
  - host: your host
  - port: 30000
  - user: test
  - user: 12345!
- __Mongo Compass:__ mongodb://host:30010/


## 📌 Languages and Tools
<code><img width="15%" src="https://www.vectorlogo.zone/logos/nodejs/nodejs-ar21.svg"></code><code><img width="15%" src="https://www.vectorlogo.zone/logos/javascript/javascript-ar21.svg"></code><code><img width="15%" src="https://www.vectorlogo.zone/logos/typescriptlang/typescriptlang-ar21.svg"></code><code><img width="15%" src="https://www.vectorlogo.zone/logos/expressjs/expressjs-ar21.svg"></code><code><img width="15%" src="https://www.vectorlogo.zone/logos/nestjs/nestjs-ar21.svg"></code><code><img width="15%" src="https://www.vectorlogo.zone/logos/postgresql/postgresql-ar21.svg"></code><code><img width="15%" src="https://www.vectorlogo.zone/logos/mongodb/mongodb-ar21.svg"></code><code><img width=15% src="https://www.vectorlogo.zone/logos/terraformio/terraformio-ar21.svg"></code><code><img width="15%" src="https://www.vectorlogo.zone/logos/kubernetes/kubernetes-ar21.svg"></code><code><img width="15%" src="https://www.vectorlogo.zone/logos/docker/docker-ar21.svg"></code>