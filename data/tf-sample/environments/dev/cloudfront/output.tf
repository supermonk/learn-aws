output "s3_bucket_endpoint" {
    value = "${module.cloudfront.s3_bucket_endpoint}"
}

output "cloudfront_endpoint" {
    value = "${module.cloudfront.cloudfront_endpoint}"
}
