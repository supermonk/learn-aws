resource "aws_db_instance" "my_database" {

    # Size of DB, default 20 GB
    allocated_storage    = "${var.db_size_in_gb}"

    storage_type         = "${var.db_storage_type}"

    # Use MySQL 5.6 by default
    engine               = "${var.db_engine}"
    engine_version       = "${var.db_engine_version}"

    # Use db.t2.micro by default
    instance_class       = "${var.db_instance_class}"

    # Database name
    name                 = "${var.db_name}"

    # Database login credentials
    username             = "${var.db_username}"
    password             = "${var.db_password}"

    multi_az = "false"
    db_subnet_group_name   = "${aws_db_subnet_group.default.id}"
    # The list of VPC, subnet and SG to associate
    vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
}

resource "aws_db_subnet_group" "default" {
  name        = "main_subnet_group"
  description = "Our main group of subnets"
  subnet_ids  = ["${var.private_subnet_id}", "${var.public_subnet_id}"]
}
