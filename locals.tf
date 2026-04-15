locals {
  profile                          = "devops"
  region                           = "us-east-1"
  vpc_prefix                       = "dev"
  vpc_name                         = "main-vpc"
  vpc_cidr_block                   = "192.168.0.0/16"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
  igw_name                         = "main_igw"
  azs                              = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
  cidr_blocks                      = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24", "192.168.4.0/24"]
  public_ips                       = [true, false, true, false]
  subnet_names                     = ["public-subnet-1a", "private-subnet-1b", "public-subnet-1c", "private-subnet-1d"]
  route_table_name                 = "internet-route"
}