#!/bin/bash
sudo yum update -y
sudo yum install -y httpd.x86_64
sudo systemctl enable httpd.service
sudo systemctl start httpd.service
sudo systemctl status httpd