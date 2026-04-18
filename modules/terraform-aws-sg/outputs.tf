output "sg_name" {
  value = aws_security_group.sg.name
}

output "sg_id" {
  value = aws_security_group.sg.id
}

output "sg_http_rule" {
  value = var.ingress_rules[*]
}