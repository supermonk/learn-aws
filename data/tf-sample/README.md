# Vagrant login
    vagrant ssh

# Manual Steps before automation 

  Create a bucket in the region designated to store the tfstate file.

  Create a dynamodb table in the region designated to store the tfstate file.
 
    Create one bucket 
    Create one dynamodb table 
# AWS key configuration :
    aws configure --profile <profile_name>
Follow instructions to provide Access Key Id and Secret Access Key

# Terraform commands to create VPC with subnets, route tables, internet gateway and NAT gateway
    cd /vagrant_data/tf-sample/environments/dev/networking/
    terraform init -backend-config=backend.tfvars
    terraform plan -var-file=terraform.tfvars
    terraform apply -var-file=terraform.tfvars

# Prerequisite for EC2 instance creation

Go to EC2 management console on AWS and create a new key-pair by navigating to "Key Pairs" section.

# Terraform commands to create one EC2 instance in the previously created VPC
    cd /vagrant_data/tf-sample/environments/dev/compute/
    terraform init -backend-config=backend.tfvars
    terraform plan -var-file=terraform.tfvars
    terraform apply -var-file=terraform.tfvars

# Destroy the EC2 instance
    cd /vagrant_data/tf-sample/environments/dev/compute/
    terraform destroy -var-file=terraform.tfvars

# Destroy the VPC
    cd /vagrant_data/tf-sample/environments/dev/networking/
    terraform destroy -var-file=terraform.tfvars
    
# DEUBG

    export TF_LOG = DEBUG

# CIDR Address
    10.0.0.0/16   (IPV4 8 bits each block = > 2 ^ 32 willl be = 1024 * 1024 * 1024 * 4 => appx 4 billion)
                   IPV6                       2 ^ 128 possible
    10 & 0  (first two 8 bits are fixed)
    
    0 &0 are modifiable
    
    10.0.0.0/32  nothing modifiable only one ip.
    10.0.0.0/31  = > 10.0.0.0.0 10.0.0.0.1

# References


[Sample VPC configuration created using Terraform](https://nickcharlton.net/posts/terraform-aws-vpc.html)

[Terraform best practices](https://github.com/BWITS/terraform-best-practices)

[GitHub repository that was referenced to create this project](https://github.com/contino/terraform-learn/tree/master/aws)

[Terraform repository conventions](https://www.terraform.io/docs/enterprise/workspaces/repo-structure.html)
