variable "vpc_id" {
  description = "Number of EC2 instances to create"
  type        = "string"
}

variable "is_public" {
  description = "This is a public facing ELB"
  default     = "true"
}

variable "elb_subnets" {
  description = "A list of subnet IDs to launch in"
  type    = "list"
}

variable "elb_instances" {
  description = "A list of of instance ids to place in the ELB pool."
  type        = "list"
}

variable "elb_access_logs_bucket_name"
{
  description = "S3 bucket where log is kept"
  type        = "string"
}

variable "elb_access_logs_bucket_prefix"
{
  description = "The S3 bucket prefix"
  default     = ""
}

variable "elb_access_logs_interval"
{
  description = "The publishing interval in minutes; default is 60"
  default     = "60"
}

variable "app_port" {
  description = "Port which application is listening"
  type        = "string"
}

variable "elb_health_check" {
  description = "Health Check URI"
  type        = "string"
}

variable "elb_health_check_protocol" {
  description = "Health Check Protocol"
  default     = "HTTP"
}

variable "elb_health_check_interval" {
  description = "Health Check Frequency"
  default     = "10"
}

variable "elb_idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle"
  default     = "60"
}

variable "elb_connection_draining" {
  description = "Boolean to enable connection draining."
  default     = false
}

variable "elb_connection_draining_timeout" {
  description = "The time in seconds to allow for connections to drain"
  default     = "300"
}

variable "elb_healthy_threshold" {
  description = "Number of checks before the instance is declared healthy"
  default     = "2"
}

variable "elb_unhealthy_threshold" {
  description = "Number of checks before the instance is decleard unhealthy"
  default     = "3"
}

variable "elb_health_check_timeout" {
  description = "The lenght of time before check is declared time out"
  default     = "5"
}

#provider
variable aws_profile {}
variable region {}
variable shared_credentials_file {}

# tags
variable "prefix" {
  type        = "string"
}
