resource "aws_security_group" "elb" {
  vpc_id      = "${var.vpc_id}"
  name        = "${format("%s-elb-sg", var.prefix)}"
  description = "${format("%s-elb-sg", var.prefix)}"

  tags  {
    "Name"         = "${format("%s-elb-sg", var.prefix)}"
  }
}

resource "aws_security_group_rule" "elb_egress_all" {
  security_group_id = "${aws_security_group.elb.id}"
  type        = "egress"
  from_port   = "0"
  to_port     = "0"
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "elb_80" {
  security_group_id = "${aws_security_group.elb.id}"
  type        = "ingress"
  from_port   = "80"
  to_port     = "80"
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "elb_443" {
  security_group_id = "${aws_security_group.elb.id}"
  type        = "ingress"
  from_port   = "443"
  to_port     = "443"
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
