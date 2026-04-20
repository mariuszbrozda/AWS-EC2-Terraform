module "vpc" {
  source                           = "./modules/terraform-aws-vpc"
  profile                          = local.profile
  region                           = local.region
  prefix                           = local.prefix
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

module "ssh" {
  source                  = "./modules/terraform-aws-ssh"
  aws_ssh_public_key_name = local.aws_ssh_public_key_name
  aws_ssh_public_key      = local.aws_ssh_public_key
  prefix                  = local.prefix
}

module "sg" {
  source        = "./modules/terraform-aws-sg"
  sg_name       = local.sg_name
  ingress_rules = local.ingress_rules
  prefix        = local.prefix
}

module "ec2" {
  source                  = "./modules/terraform-aws-ec2"
  instance_type           = local.instance_type
  instance_name           = local.instance_name
  public_ip               = local.public_ip
  sg_ids                  = [module.sg.sg_id]
  aws_ssh_public_key_name = module.ssh.key_pair_name
  prefix                  = local.prefix
}