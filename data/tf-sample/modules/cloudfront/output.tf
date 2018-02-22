output "s3_bucket_endpoint" {
    value = "${aws_s3_bucket.my_bucket.bucket_domain_name}"
}

output "cloudfront_endpoint" {
    value = "${aws_cloudfront_distribution.my_distribution.domain_name}"
}