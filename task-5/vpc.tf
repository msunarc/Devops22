resource "aws_vpc" "VPC_jenkins" {
  cidr_block           = var.cidr_block[0]
  enable_dns_hostnames = true
  tags = {
    Name = "Jenkins-VPC"
  }

}

# Create Subnet

resource "aws_subnet" "subnet_Jenkins" {
  vpc_id     = aws_vpc.VPC_jenkins.id
  cidr_block = var.cidr_block[1]

  tags = {
    Name = "subnet_jenkins"
  }
}

# Create Internet Gateway

resource "aws_internet_gateway" "IGW_jenkins" {
  vpc_id = aws_vpc.VPC_jenkins.id

  tags = {
    Name = "IGW_jenkins"
  }
}

resource "aws_route_table" "Jenkins_RouteTable" {
  vpc_id = aws_vpc.VPC_jenkins.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW_jenkins.id
  }

  tags = {
    Name = "Jenkins_Rt"
  }
}

resource "aws_route_table_association" "RT_associate" {
  subnet_id      = aws_subnet.subnet_Jenkins.id
  route_table_id = aws_route_table.Jenkins_RouteTable.id
}