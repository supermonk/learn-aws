output "rds_sg_id" {
  value = "${aws_security_group.rds_sg.id}"
}

output "rds_endpoint" {
  value = "${aws_db_instance.my_database.endpoint}"
}
