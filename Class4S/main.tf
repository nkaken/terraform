data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  availability_zone = "us-east-2a"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  
}

resource "aws_key_pair" "deployer" {
  key_name   = "deplyr-key"
  public_key = file("~/.ssh/id_rsa.pub")

}

output ec2 {
  value       = aws_instance.web.public_ip
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
    ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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

resource "null_resource" "cluster" {
  triggers = {
    always_run = "${timestamp()}"
  }

  connection {
    host = element(aws_instance.web[*].public_ip, 0)
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install apache2 -y"
    ]
  }
}