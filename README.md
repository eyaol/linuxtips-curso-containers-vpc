# linuxtips-curso-containers-vpc
Aula de VPC do curso de formação de containers AWS

# comandos terraform usados
terraform init -backend-config=environment/dev/backend.tfvars

terraform apply --auto-approve -var-file=environment/dev/terraform.tfvars

terraform destroy --auto-approve -var-file=environment/dev/terraform.tfvars