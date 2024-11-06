resource "aws_instance" "wed_server" {
  ami = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  subnet_id = var.sn
  security_groups = [var.sg] 
  
  tags = {
    Name = "WebServer"
  }
}