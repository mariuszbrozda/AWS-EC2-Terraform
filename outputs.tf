output "key_pair_name" {
    description = "SSH public key name"
    value = aws_key_pair.aws_keypair.key_name
}

output "sg_http_rule" {
    value = var.ingress_rules[*]
}