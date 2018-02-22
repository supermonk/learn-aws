resource "aws_security_group" "ec2_sg" {
	description = "Allow SSH traffic incoming, allow all outgoing traffic"
  vpc_id      = "${var.vpc_id}"

  # allow SSH connectivity
	ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    security_groups = ["${var.elb_sg_id}"]
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
      Name       = "${var.name_tag_prefix} - ec2_sg"
  }
}
