data "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/16"
  depends_on = [aws_vpc.main_vpc]
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:Name"
    values = ["*public*"]
  }
  depends_on = [aws_vpc.main_vpc, aws_subnet.subnet]
}