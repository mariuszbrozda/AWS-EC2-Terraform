output "ami" {
  value = data.aws_ami.latest_ami.id
}

output "ec2_public_ip_address" {
  description = "EC2 Public IP"
  value       = aws_instance.ec2_instance.public_ip
}

output "webserver_url" {
  value = join("//", ["http:", aws_instance.ec2_instance.public_ip])
}