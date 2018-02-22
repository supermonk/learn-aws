module "elb" {
  source   = "./../../../modules/elb"

  aws_profile = "${var.aws_profile}"
  region = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"

  vpc_id            = "${data.terraform_remote_state.vpc.vpc_id}"
  elb_subnets       = ["${data.terraform_remote_state.vpc.public_subnet_a_id}"]
  elb_instances     = ["${module.compute.ec2_instance_id}"]
  is_public         = "true"

  # logging
  elb_access_logs_bucket_name    = "${var.elb_logs_bucket_name}"
  elb_access_logs_bucket_prefix  = "${var.elb_access_logs_bucket_prefix}"
  elb_access_logs_interval       = "${var.elb_access_logs_interval}"

  # Health Check
  app_port                  = "${var.app_port}"
  elb_health_check          = "${var.elb_health_check}"
  elb_health_check_protocol = "${var.elb_health_check_protocol}"
  elb_healthy_threshold     = "${var.elb_healthy_threshold}"
  elb_unhealthy_threshold   = "${var.elb_unhealthy_threshold}"
  elb_health_check_timeout  = "${var.elb_health_check_timeout}"

  # TAGS
  prefix          = "${var.name_tag_prefix}"

}
