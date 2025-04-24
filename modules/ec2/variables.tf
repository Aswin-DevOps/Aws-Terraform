# VPC Details 
variable "public_subnets" {}
variable "private_subnets" {}
variable "vpc_id" {}

# EC2 Details
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "environment" {}
variable "sg_name" {}
# variable "app_instance_type" {}
# variable "app_key_name" {}
variable "instance_configs" {}
variable "volume_size" {}
variable "volume_type" {}