resource "aws_key_pair" "aws_keypair" {
  key_name   = var.aws_ssh_public_key_name
  public_key = var.aws_ssh_public_key

  tags = {
    Name = "${var.prefix}-${var.aws_ssh_public_key_name}"
  }
}