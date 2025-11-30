provider "aws" {
    region = var.region
  
}
resource "aws_instance" "Jarvis" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.Jarvis-sg.id ]
  user_data = file("user-data.sh")

  tags = {
    Name = "jarvis-server"
  }

}
resource "aws_security_group" "Jarvis-sg" {
  name = "tf-sg"

  ingress {
    description = "allow ssh"
    to_port = 22
    from_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow http"
    to_port = 80
    from_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow all traffic"
    to_port = 0
    from_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

}