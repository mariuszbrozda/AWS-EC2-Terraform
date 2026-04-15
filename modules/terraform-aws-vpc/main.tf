# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block                       = var.vpc_cidr_block
  enable_dns_support               = var.enable_dns_support
  enable_dns_hostnames             = var.enable_dns_hostnames
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block

  tags = {
    Name = "${var.vpc_prefix}-${var.vpc_name}"
  }
}

# Internet aws_internet_gateway

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.vpc_prefix}-${var.igw_name}"
  }
  depends_on = [aws_vpc.main_vpc]
}

# VPC Subnets
resource "aws_subnet" "subnet" {
  count                   = length(var.cidr_blocks)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.cidr_blocks[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = var.public_ips[count.index]

  tags = {
    Name = "${var.vpc_prefix}-${var.subnet_names[count.index]}"
  }
  depends_on = [aws_vpc.main_vpc]
}