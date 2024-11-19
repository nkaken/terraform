packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "example" {
  ami_name      = "golden-imag-{{timestamp}}"
  instance_type = "t2.micro"
  region = "us-east-1"
  source_ami = "ami-012967cc5a8c9f891"
  ssh_username = "ec2-user"
  ssh_keypair_name = "packer"
  ssh_private_key_file = "~/.ssh/id_rsa"
  
  run_tags = {
    Name = "golden imag"
  }
  ami_regions        = ["us-east-1", "us-east-2"]
#   source_ami_filter {
#     filters = {
#       name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
#       root-device-type    = "ebs"
#       virtualization-type = "hvm"
#     }
#     most_recent = true
#     owners      = ["099720109477"]
#   }
  
}

build {
  sources = ["source.amazon-ebs.example"]

  provisioner "shell" {
    script = "setup.sh"
  }

  provisioner "breakpoint" {
    note = "Verify"
  }
}
