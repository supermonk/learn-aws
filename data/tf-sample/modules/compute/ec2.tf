provider "aws" {
  profile = "${var.aws_profile}"
  region = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"
}

resource "aws_instance" "ec2_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    subnet_id = "${var.subnet_id}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    vpc_security_group_ids = ["${aws_security_group.ec2_sg.id}"]

    tags {
        Name = "${var.name_tag_prefix} - ec2 - ${count.index}"
    }

    user_data = "${var.user_data}"
}
