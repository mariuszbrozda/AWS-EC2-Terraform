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

variable "prefix" {
  type = string
}