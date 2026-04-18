data "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/16"
  depends_on = [aws_vpc.main_vpc]
}