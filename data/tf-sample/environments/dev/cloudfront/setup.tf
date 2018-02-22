terraform {
    backend "s3" {}
}

module "cloudfront" {

    source      = "./../../../modules/cloudfront"
    aws_profile = "${var.aws_profile}"
    region = "${var.region}"
    s3_bucket_name = "${var.s3_bucket_name}"
}