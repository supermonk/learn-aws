# Vagrant login
    vagrant ssh

# AWS key configuration :
    aws configure --profile <profile_name>
Follow instructions to provide Access Key Id and Secret Access Key

# Terraform commands to create VPC with subnets, route tables, internet gateway and NAT gateway
    cd /vagrant/data/tf-sample/environments/dev/networking/
    terraform init -backend-config=backend.tfvars
    terraform plan -var-file=terraform.tfvars
    terraform apply -var-file=terraform.tfvars

# Terraform commands to create one EC2 instance in the previously created VPC
    cd /vagrant/data/tf-sample/environments/dev/compute/
    terraform init -backend-config=backend.tfvars
    terraform plan -var-file=terraform.tfvars
    terraform apply -var-file=terraform.tfvars

# Destroy the EC2 instance
    cd /vagrant/data/tf-sample/environments/dev/compute/
    terraform destroy -var-file=terraform.tfvars

# Destroy the VPC
    cd /vagrant/data/tf-sample/environments/dev/networking/
    terraform destroy -var-file=terraform.tfvars