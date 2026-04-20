variable "instance_type" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "public_ip" {
  type = bool
}

variable "sg_ids" {
  type = list(string)
}

variable "aws_ssh_public_key_name" {
  type = string
}

variable "prefix" {
  type = string
}