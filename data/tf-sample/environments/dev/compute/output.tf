output "ec2_instance_id" {
  value = "${module.compute.ec2_instance_id}"
}

output "ec2_sg_id" {
  value = "${module.compute.ec2_sg_id}"
}

output "elb_dns_name" {
  value = "${module.elb.elb_dns_name}"
}

output "elb_sg_id" {
  value = "${module.elb.elb_sg_id}"
}
