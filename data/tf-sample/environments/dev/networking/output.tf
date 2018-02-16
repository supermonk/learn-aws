output "vpc_id" {
  # output all the variables from module
  value = "${module.networking.vpc_id}"
}

output "public_subnet_a_id" {
  value = "${module.networking.public_subnet_a_id}"
}

output "private_subnet_a_id" {
  value = "${module.networking.private_subnet_a_id}"
}
