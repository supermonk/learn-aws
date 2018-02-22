variable aws_profile {}

variable region {}

variable db_size_in_gb {
    default = 20
}

variable db_storage_type {
    default = "gp2"
}

variable db_engine {
    default = "mysql"
}

variable db_engine_version {
    default = "5.6.37"
}

variable db_instance_class {
    default = "db.t2.micro"
}

variable db_name {
    default = "terraformTest"
}

variable db_username {
    default = "admin"
}

variable db_password {
    default = "password"
}

variable ec2_sg_id {}

variable vpc_id {}

variable private_subnet_id {}

variable public_subnet_id {}

variable name_tag_prefix {}
