terraform {
  backend "s3" {}
}

module "networking" {
  source      = "./../../../modules/networking"

  aws_profile = "${var.aws_profile}"
  region = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"

  name_tag_prefix = "${var.name_tag_prefix}"
  vpc_cidr_block = "${var.vpc_cidr_block}"
  public_subnet_a_cidr_block = "${var.public_subnet_a_cidr_block}"
  private_subnet_a_cidr_block = "${var.private_subnet_a_cidr_block}"
  availability_zone_1 = "${var.availability_zone_1}"
}
