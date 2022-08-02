# Create Security Group for the Application Load Balancer
# terraform aws create security group
resource "aws_security_group" "alb-security-group" {
  name        = "ALB security group"
  description = "SG for load balanceer"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "SG for inflow traffic-Https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Http access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "ALB SG"
  }
}

# Create Security Group for the Bastion Host aka Jump Box
# terraform aws create security group
resource "aws_security_group" "ssh-security-group" {
  name        = "SSH access"
  description = "SG for bastion"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "SG for SSh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${var.SSh_location}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "SSH SG"
  }
}

# Create Security Group for the Web Server
# terraform aws create security group
resource "aws_security_group" "webserver-security-group" {
  name        = "WEB server Sg"
  description = "SG for web server"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "Http access"
    from_port        = 80
    to_port          =80
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.alb-security-group.id}"]
  }

  ingress {
    description      = "Https access"
    from_port        = 443
    to_port          = 443
    protocol         ="tcp"
    security_groups  =["${aws_security_group.alb-security-group.id}"]
  }

  ingress {
    description      ="SSh access"
    from_port        = 22 
    to_port          = 22 
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.ssh-security-group.id}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "Web sever security grp"
  }
}

# Create Security Group for the Database
# terraform aws create security group
resource "aws_security_group" "database-security-group" {
  name        = "DB sg"
  description = "SG for DB"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "DB Sg"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.webserver-security-group.id}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name =" DB Sg"
  }
}