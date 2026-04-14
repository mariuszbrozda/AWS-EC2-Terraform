data "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/16"
  depends_on = [aws_vpc.main_vpc]
}

data "aws_subnet" "public_subnet_1a" {
  vpc_id = data.aws_vpc.vpc.id
  tags = {
    "Name" = "*public-subnet*"
  }
  filter {
    name   = "tag:Name"
    values = ["*1a*"]
  }
}