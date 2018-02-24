terraform {
    backend "s3" {}
}

module "rds" {

    source = "./../../../modules/rds"
    aws_profile = "${var.aws_profile}"
    region = "${var.region}"

    public_subnet_id = "${data.terraform_remote_state.vpc.public_subnet_a_id}"
    private_subnet_id = "${data.terraform_remote_state.vpc.private_subnet_a_id}"
    vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
    ec2_sg_id = "${module.compute.ec2_sg_id}"
    name_tag_prefix = "${var.name_tag_prefix}"

    db_name = "${var.db_name}"
    db_username = "${var.db_username}"
    db_password = "${var.db_password}"

}
