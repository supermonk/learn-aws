resource "aws_s3_bucket" "my_bucket" {
    
    bucket        = "${var.s3_bucket_name}"
    region        = "${var.s3_bucket_region}"
    acl           = "public-read"
    # Will destroy S3 bucket even if it's not empty.
    force_destroy = true

    tags {
        Name = "${var.s3_bucket_name}"
        Environment = "${var.env}"
    }
}