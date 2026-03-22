resource "aws_instance" "ec2_instance" {
  ami                         = data.aws_ami.latest_ami.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.public_subnet_1a.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  key_name                    = aws_key_pair.aws_keypair.key_name

  provisioner "local-exec" {
    command    = "echo ${var.instance_name}:${self.private_ip} >> ec2s.txt"
    on_failure = continue
  }

  provisioner "file" {
    source      = "install_httpd.sh"
    destination = "/tmp/install_httpd.sh"
    on_failure  = continue
  }

  connection {
    type        = "ssh"
    host        = aws_instance.ec2_instance.public_ip
    user        = "ec2-user"
    private_key = file("~/.ssh/aws-golden-key")
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    inline     = ["chmod u+x /tmp/install_httpd.sh", "/tmp/install_httpd.sh"]
    on_failure = continue
  }

  provisioner "remote-exec" {
    inline     = ["sudo hostnamectl set-hostname ${var.instance_name}"]
    on_failure = continue
  }

  tags = {
    Name = "${var.prefix}-${var.instance_name}"
  }
}