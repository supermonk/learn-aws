output "ec2_instance_id" {
  value = "${aws_instance.ec2_instance.*.id}"
}

output "ec2_sg_id" {
  value = "${aws_security_group.ec2_sg.id}"
}
