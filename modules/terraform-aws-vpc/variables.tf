# Provider variables
variable "profile" {
  type = string
}
variable "region" {
  type = string
}

variable "vpc_prefix" {
  description = "VPC prefix"
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