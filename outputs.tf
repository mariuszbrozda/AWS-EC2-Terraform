output "key_pair_name" {
  description = "SSH public key name"
  value       = aws_key_pair.aws_keypair.key_name
}

output "sg_http_rule" {
  value = var.ingress_rules[*]
}

output "ami" {
  value = data.aws_ami.latest_ami.id
}

output "public_subnet_1a_id" {
  description = "Subnet ID"
  value       = data.aws_subnet.public_subnet_1a.id
}

output "ec2_public_ip_address" {
  description = "EC2 Public IP"
  value       = aws_instance.ec2_instance.public_ip
}