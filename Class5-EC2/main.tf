resource "aws_instance" "web" {
  ami           = "ami-012967cc5a8c9f891"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tlss.id]
  
}

resource "aws_security_group" "allow_tlss" {
  name        = "allow_tlss"
  description = "Allow TLS inbound traffic"
  
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
}
}