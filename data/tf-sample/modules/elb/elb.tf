provider "aws" {
  profile = "${var.aws_profile}"
  region = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"
}

# Classic ELB
resource "aws_elb" "elb" {
  name            = "${format("%s-elb", var.prefix)}"
  subnets         = [ "${var.elb_subnets}" ]
  security_groups = [ "${aws_security_group.elb.id}" ]
  instances       = [ "${var.elb_instances}" ]

  cross_zone_load_balancing   = true
  idle_timeout                = "${var.elb_idle_timeout}"
  connection_draining         = "${var.elb_connection_draining}"
  connection_draining_timeout = "${var.elb_connection_draining_timeout}"
  internal                    = "${var.is_public == "0" ? true : false}"

  access_logs {
    bucket        = "${var.elb_access_logs_bucket_name}"
    bucket_prefix = "${var.elb_access_logs_bucket_prefix}"
    interval      = "${var.elb_access_logs_interval}"
  }

  listener {
    instance_port      = "${var.app_port}"
    instance_protocol  = "http"
    lb_port            = "80"
    lb_protocol        = "http"
  }

  health_check {
    healthy_threshold   = "${var.elb_healthy_threshold}"
    unhealthy_threshold = "${var.elb_unhealthy_threshold}"
    interval            = "${var.elb_health_check_interval}"
    target              = "${format("%s:%s%s", var.elb_health_check_protocol, var.app_port, var.elb_health_check)}"
    timeout             = "${var.elb_health_check_timeout}"
  }

  tags {
    "Name"         = "${format("%s-elb", var.prefix)}"
  }
}
