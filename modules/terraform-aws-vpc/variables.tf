# Provider variables
variable "profile" {
  type = string
}
variable "region" {
  type = string
}

variable "prefix" {
  description = "Prefix"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS Support"
  type        = bool
  default      = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostname"
  type        = bool
  default      = true
}

variable "assign_generated_ipv6_cidr_block" {
  description = "Assign generated ipv6 cidr block"
  type        = bool
  default      = false
}


variable "igw_name" {
  description = "IGW name"
  type        = string
}

# Subnet variables
variable "azs" {
  type = list(string)
}
variable "cidr_blocks" {
  type = list(string)
}
variable "public_ips" {
  type = list(bool)
}
variable "subnet_names" {
  type = list(string)
}

variable "route_table_name" {
  type = string
}