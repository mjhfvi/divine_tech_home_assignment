# Divine Tech Home Assignment

Description: A GitHub repository containing the code, IaC, and pipeline
this how to deploy, how to tear down, and a simple architecture diagram
using an Azure Free Account, There is no need to keep the environment running after submission.

## Configuration Automation Files

the project include general files to complete tasks before pushing to git

- `.pre-commit-config.yaml` to run automated task before uploading new code to git
- `.typos.toml` to check for typos in the text
- `.gitleaks.toml` to check for password or secrets leaks
- `.yamllint.yaml` to check code lint

and other files for different issues

## Python Code

the application code is located in the `src` folder

- APP
  - API
  - Worker

## Pipeline

in Github Actions, run `reusable_docker_build_image.yaml` pipeline
setup the git project in github actions with variable inputs for the pipeline

- ACR_NAME
- IMAGE_NAME
- RESOURCE_GROUP
- CONTAINER_APP_NAME

## Terraform

### terraform code will build

- Azure Container Registry
- Azure Container Apps (for the API and the Worker)
- Azure Service Bus Queue
- Azure Key Vault
- Log Analytics Workspace

```bash
cd terraform

terraform init

terraform plan -var-file="secret.tfvars" -out=plan-out

terraform apply -var-file="secret.tfvars" -out=plan-out

terraform destroy
```

## Build Docker Image

- build docker image

```bash
docker build . -t divine-ai:000
```

- login to azure account

```bash
az acr login --name registry_name
```

- push docker image to azure acr

```bash
docker push registry_name.azurecr.io/divine-ai:000
docker push registry_name.azurecr.io/divine-ai:latest
```

- run docker container

```bash
docker run -p 8000:8000 --name divine-app divine-ai:000
docker run -p 8000:8000 --name divine-app divine-ai:latest
```

## Testing API

curl -X POST localhost:8000/webhook/message -H 'Content-Type: application/json' -d '{"user":"alice","text":"hi"}'
curl localhost:8000/health

## One Paragraph: "What I would change in a real production environment"

- in a `production environment` you should think about security and never hard-code password or secrets
  secure the connection between the resource and endpoints
  separate the api and worker
  change the infrastructure to kubernetes for better automation (ArgoCD) and resource management
  add more logs levels for the application for debugging
