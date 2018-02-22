resource "aws_s3_bucket" "my_bucket" {
    
    bucket = "${var.s3_bucket_name}"
    region = "${var.s3_bucket_region}"
    acl    = "public-read"

    tags {
        Name = "${var.s3_bucket_name}"
        Environment = "${var.env}"
    }
}