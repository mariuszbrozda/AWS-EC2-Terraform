

data "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/16"
}

data "aws_ami" "latest_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "free-tier-eligible"
    values = [true]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
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