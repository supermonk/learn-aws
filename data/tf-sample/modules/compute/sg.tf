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