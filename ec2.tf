resource "aws_instance" "ec2_instance" {
  ami                         = data.aws_ami.latest_ami.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.public_subnet_1a.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  key_name                    = aws_key_pair.aws_keypair.key_name

  tags = {
    Name = "${var.prefix}-${var.instance_name}"
  }
}