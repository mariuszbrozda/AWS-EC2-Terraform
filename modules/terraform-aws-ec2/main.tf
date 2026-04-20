resource "aws_instance" "ec2_instance" {
  ami                         = data.aws_ami.latest_ami.id
  instance_type               = var.instance_type
  associate_public_ip_address = var.public_ip
  subnet_id                   = data.aws_subnet.public_subnet_1a.id
  vpc_security_group_ids      = var.sg_ids
  key_name     = var.aws_ssh_public_key_name

  tags = {
    Name = "${var.prefix}-${var.instance_name}"
  }
}

resource "null_resource" "trigger_on_instance_id" {
  triggers = {
    id = aws_instance.ec2_instance.id
  }

  provisioner "local-exec" {
    command    = "echo ${var.instance_name}:${aws_instance.ec2_instance.private_ip} >> ec2s.txt"
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
}