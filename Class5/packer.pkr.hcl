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
  region = "us-east-2"
  source_ami = "ami-0942ecd5d85baa812"
  ssh_username = "ec2-user"
  ssh_keypair_name = "packer-key"
  ssh_private_key_file = "~/.ssh/id_rsa"
  
  run_tags = {
    Name = "golden imag"
  }
  ami_regions        = ["us-east-1", "us-east-2"]
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
