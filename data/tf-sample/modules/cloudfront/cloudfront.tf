resource "aws_cloudfront_distribution" "my_distribution" {

    origin {
        domain_name = "${aws_s3_bucket.my_bucket.bucket_domain_name}"
        origin_id   = "S3-${aws_s3_bucket.my_bucket.id}"

        custom_origin_config  {
            http_port = 80
            https_port = 443
            origin_protocol_policy = "match-viewer"
            origin_ssl_protocols = ["TLSv1", "TLSv1.1", "TLSv1.2"]
        }
    }
    
    default_root_object = "index.html"
    enabled             = true
    is_ipv6_enabled     = true
    default_root_object = "index.html"

    aliases = []

    default_cache_behavior {

        allowed_methods  = ["GET", "HEAD"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = "S3-${aws_s3_bucket.my_bucket.id}"

        forwarded_values {
            query_string = true
            cookies {
                forward = "none"
            }
      }

        viewer_protocol_policy = "allow-all"
        min_ttl                = 0
        default_ttl            = 60
        max_ttl                = 120
    }
    price_class = "PriceClass_100"

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    tags {
        environment = "${var.env}"
    }

    # SSL certificate for the service.
    viewer_certificate {
        cloudfront_default_certificate = true
    }
}