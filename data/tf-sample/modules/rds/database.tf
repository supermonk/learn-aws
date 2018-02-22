resource "aws_db_instance" "my_database" {
    
    # Size of DB, default 2 GB
    allocated_storage    = "${var.db_size_in_gb}"

    storage_type         = "${var.db_storage_type}"

    # Use MySQL 5.6 by default
    engine               = "${var.db_engine}"
    engine_version       = "${var.db_engine_version}"

    # Use db.t1.micro by default
    instance_class       = "${var.db_instance_class}"

    # Database name
    name                 = "${var.db_name}"

    # Database login credentials
    username             = "${var.db_username}"
    password             = "${var.db_password}"

    # The list of VPC, subnet and SG to associate 
    vpc_security_group_ids = ["${aws_security_group.ec2_sg.id}"]
}