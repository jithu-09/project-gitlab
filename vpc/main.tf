resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name="myvpc"
  }
}

resource "aws_subnet" "my_sn" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name= "my_sn"
  }
}

resource "aws_security_group" "my_sg" {
  vpc_id = aws_vpc.vpc.id
  name = "my_sg"
  description = "security group"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}