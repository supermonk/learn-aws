terraform {
  backend "s3" {}
}

module "compute" {
  source      = "./../../../modules/compute"

  aws_profile = "${var.aws_profile}"
  region = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"

  vpc_remote_state_bucket = "${var.vpc_remote_state_bucket}"
  vpc_remote_state_key = "${var.vpc_remote_state_key}"
  vpc_remote_state_region = "${var.vpc_remote_state_region}"

  name_tag_prefix = "${var.name_tag_prefix}"

  ami_id = "${var.ami_id}"
  number_of_instances = "${var.number_of_instances}"
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
  subnet_id = "${data.terraform_remote_state.vpc.public_subnet_a_id}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
}
