terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}
resource "aws_instance" "Jenkins" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "virKP"
  vpc_security_group_ids      = [aws_security_group.SG_jenkins.id]
  subnet_id                   = aws_subnet.subnet_Jenkins.id
  associate_public_ip_address = true
  user_data                   = file("jenkins.sh")

  tags = {
    Name = "Jenkins-Server"
  }
}