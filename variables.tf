# Variables declarations

variable "region" {
  type = string
}

variable "profile" {
  type = string
}

variable "prefix" {
  type = string
}

variable "aws-ssh-public-key-name" {
  type = string
}

variable "aws-ssh-public-key" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "ingress_rules" {
  type = set(object({
    description = string
    from_port   = string
    to_port     = string
    protocol    = string
    cidr_blocks = string
  }))
}

variable "instance_type" {
  type = string
}

variable "instance_name" {
  type = string
}