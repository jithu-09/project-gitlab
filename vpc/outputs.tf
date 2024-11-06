output "my_sn" {
  value = aws_subnet.my_sn.id
}

output "my_sg" {
  value = aws_security_group.my_sg.id
}