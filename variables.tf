# Providers Details
variable "region" {}

# VPC Details
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "environment" {}
variable "private_subnets" {}
variable "public_subnets" {}

# EC2 Details
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "sg_name" {}
variable "instance_configs" {}
variable "volume_size" {}
variable "volume_type" {}
