terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}
resource "aws_instance" "softsware" {
  ami= var.ami
    instance_type = var.instance_type
  key_name = "virKP"
  vpc_security_group_ids = [aws_security_group.alb-security-group.id]
  
  user_data = file("jenkins.sh")

}