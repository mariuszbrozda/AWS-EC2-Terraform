resource "aws_key_pair" "aws_keypair" {
  key_name   = var.aws-ssh-public-key-name
  public_key = var.aws-ssh-public-key

  tags = {
    Name = "${var.prefix}-${var.aws-ssh-public-key-name}"
  }
}