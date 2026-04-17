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

# Public routetables for internet access
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = "${var.vpc_prefix}-${var.route_table_name}"
  }
  depends_on = [aws_vpc.main_vpc, aws_internet_gateway.main_igw]
}

resource "aws_route_table_association" "public_rt_association" {
  count          = length(data.aws_subnets.public_subnets.ids)
  subnet_id      = data.aws_subnets.public_subnets.ids[count.index]
  route_table_id = aws_route_table.public_route_table.id

  depends_on = [data.aws_subnets.public_subnets]
}