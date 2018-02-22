aws_profile = "b2b-local"
region = "eu-west-1"
shared_credentials_file = "~/.aws/credentials"

vpc_remote_state_bucket = "a.nainamvala.cloud.samsung.com"
vpc_remote_state_key = "terraform/states/dev/n.bidari/compute/terraform.tfstate"
vpc_remote_state_region = "us-east-1"

name_tag_prefix = "n.bidari-test"

ami_id = "ami-db1688a2"
number_of_instances = "1"
vpc_id = ""
subnet_id = ""
instance_type = "t2.micro"
key_name = "n.bidari-test"
