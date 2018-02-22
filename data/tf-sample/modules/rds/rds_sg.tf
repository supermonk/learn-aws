resource "aws_security_group" "rds_sg" {
	description = "Allow 3306 traffic from EC2 incoming, allow all outgoing traffic"
  vpc_id      = "${var.vpc_id}"

	ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "TCP"
    security_groups = ["${var.ec2_sg_id}"]
	}

  # allow all outgoing traffic
	egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
	}

  # metadata tagging
	tags {
      Name       = "${var.name_tag_prefix} - rds_sg"
  }
}
