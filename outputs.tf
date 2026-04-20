output "vpc-cidr" {
  value = module.vpc.vpc_cidr
}

output "ssh-key" {
  value = module.ssh.key_pair_name
}

output "ec2-sg-name" {
  value = module.sg.sg_name
}

output "webserver-url" {
  value = module.ec2.webserver_url
}