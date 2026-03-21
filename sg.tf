# Security Groups

resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = "Allow HTTP & SSH inbound traffic"
  vpc_id      = data.aws_vpc.vpc.id

  lifecycle {
    # Necessary if changing 'name' or 'name_prefix' properties.
    create_before_destroy = true
  }

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description      = ingress.value.description
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = [ingress.value.cidr_blocks]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.prefix}-${var.sg_name}"
  }
}