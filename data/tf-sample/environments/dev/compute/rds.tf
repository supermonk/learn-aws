terraform {
    backend "s3" {}
}

module "rds" {
    
    source = "./../../../modules/rds"
    aws_profile = "${var.aws_profile}"
    region = "${var.region}"
}