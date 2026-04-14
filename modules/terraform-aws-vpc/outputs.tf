# Outputs
output "vpc_cidr" {
  description = "VPC CIDR"
  value       = aws_vpc.main_vpc.cidr_block
}