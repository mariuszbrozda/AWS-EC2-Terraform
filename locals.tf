locals {
  profile        = "devops"
  region         = "us-east-1"
  vpc_prefix                       = "dev"
  vpc_name                         = "main-vpc"
  vpc_cidr_block                   = "192.168.0.0/16"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
}