variable aws_profile {}

variable region {}

variable db_size_in_gb {
    default = 2
}

variable db_storage_type {
    default = "gp2"
}

variable db_engine {
    default = "mysql"
}

variable db_engine_version {
    default = "5.6.17"
}

variable db_instance_class {
    default = "db.t1.micro"
}

variable db_name {
    default = "terraform-test"
}

variable db_username {
    default = "admin"
}

variable db_password {
    default = "password"
}