terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}
resource "aws_instance" "task1" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "virKP"
  vpc_security_group_ids = [aws_security_group.MyLab_Sec_Group.id]
 
  associate_public_ip_address = true
  user_data = file("tomcatTF.sh")
}
  tags = {
    Name = "softsware-Server"
  }