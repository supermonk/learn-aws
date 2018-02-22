terraform {
  backend "s3" {}
}

module "compute" {
  source      = "./../../../modules/compute"

  aws_profile = "${var.aws_profile}"
  region = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"

  vpc_remote_state_bucket = "${var.vpc_remote_state_bucket}"
  vpc_remote_state_key = "${var.vpc_remote_state_key}"
  vpc_remote_state_region = "${var.vpc_remote_state_region}"

  name_tag_prefix = "${var.name_tag_prefix}"

  ami_id = "${var.ami_id}"
  number_of_instances = "${var.number_of_instances}"
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
  subnet_id = "${data.terraform_remote_state.vpc.public_subnet_a_id}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"

  elb_sg_id = "${module.elb.elb_sg_id}"

  user_data = <<HEREDOC
  #!/bin/bash
  yum update -y
  yum install httpd php php-mysql stress -y
  cd /etc/httpd/conf
  cp httpd.conf httpdconfbackup.conf
  rm -rf httpd.conf
  wget https://s3-eu-west-1.amazonaws.com/acloudguru-wp/httpd.conf
  cd /var/www/html
  echo "healthy" > healthy.html
  wget https://wordpress.org/latest.tar.gz
  tar -xzf latest.tar.gz
  cp -r wordpress/* /var/www/html/
  rm -rf wordpress
  rm -rf latest.tar.gz
  chmod -R 755 wp-content
  chown -R apache:apache wp-content
  service httpd start
  chkconfig httpd on
  HEREDOC
}
