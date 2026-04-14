module "vpc" {
  source                           = "./modules/terraform-aws-vpc"
  profile                          = local.profile
  region                           = local.region
  vpc_prefix                       = local.vpc_prefix
  vpc_name                         = local.vpc_name
  vpc_cidr_block                   = local.vpc_cidr_block
  enable_dns_support               = local.enable_dns_support
  enable_dns_hostnames             = local.enable_dns_hostnames
  assign_generated_ipv6_cidr_block = local.assign_generated_ipv6_cidr_block
  igw_name                         = local.igw_name
  azs                              = local.azs
  cidr_blocks                      = local.cidr_blocks
  public_ips                       = local.public_ips
  subnet_names                     = local.subnet_names
  route_table_name                 = local.route_table_name
}

resource "aws_instance" "ec2_instance" {
  ami                         = data.aws_ami.latest_ami.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.public_subnet_1a.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  key_name                    = aws_key_pair.aws_keypair.key_name

  tags = {
    Name = "${var.prefix}-${var.instance_name}"
  }
}

resource "null_resource" "trigger_on_instance_id" {
  triggers = {
    id = aws_instance.ec2_instance.id
  }

  provisioner "local-exec" {
    command    = "echo ${var.instance_name}:${aws_instance.ec2_instance.private_ip} >> ec2s.txt"
    on_failure = continue
  }

  provisioner "file" {
    source      = "install_httpd.sh"
    destination = "/tmp/install_httpd.sh"
    on_failure  = continue
  }

  connection {
    type        = "ssh"
    host        = aws_instance.ec2_instance.public_ip
    user        = "ec2-user"
    private_key = file("~/.ssh/aws-golden-key")
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    inline     = ["chmod u+x /tmp/install_httpd.sh", "/tmp/install_httpd.sh"]
    on_failure = continue
  }

  provisioner "remote-exec" {
    inline     = ["sudo hostnamectl set-hostname ${var.instance_name}"]
    on_failure = continue
  }
}