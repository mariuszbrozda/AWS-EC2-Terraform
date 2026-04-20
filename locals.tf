# Sample locals file
# VPC
locals {
  profile                          = "<aws_profile_name>"
  region                           = "us-east-1"
  prefix                           = "dev"
  vpc_name                         = "main-vpc"
  vpc_cidr_block                   = "192.168.0.0/16"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
  igw_name                         = "igw"
  azs                              = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
  cidr_blocks                      = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24", "192.168.4.0/24"]
  public_ips                       = [true, false, true, false]
  subnet_names                     = ["public-subnet-1a", "private-subnet-1b", "public-subnet-1c", "private-subnet-1d"]
  route_table_name                 = "internet-route"
}

# Security Groups
locals {

  sg_name = "sg"
  ingress_rules = [
    {
      "description" = "Rule allowing ssh inbound traffic"
      "from_port"   = "22"
      "to_port"     = "22"
      "protocol"    = "TCP"
      "cidr_blocks" = "0.0.0.0/0"
    },
    {
      "description" = "Rule allowing http inbound traffic"
      "from_port"   = "80"
      "to_port"     = "80"
      "protocol"    = "TCP"
      "cidr_blocks" = "0.0.0.0/0"
    },
    {
      "description" = "Rule allowing ICMP ping from internet"
      "from_port"   = "0"
      "to_port"     = "0"
      "protocol"    = "icmp"
      "cidr_blocks" = "0.0.0.0/0"
    }
  ]
}

# SSH
locals {
  aws_ssh_public_key_name = "<ssh_public_key_name>"
  aws_ssh_public_key      = "<ssh key>"
}

# EC2
locals {
  instance_type = "t2.micro"
  instance_name = "webserver"
  public_ip     = true
}
