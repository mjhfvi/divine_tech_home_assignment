# Terraform

add the token information to the `secret.tfvars` file
run terraform

```bash
terraform init
terraform plan -var-file="secret.tfvars" -out=plan-out -var 'environment=dev'
terraform apply "plan-out"
```
