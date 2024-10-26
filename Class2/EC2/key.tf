resource "aws_key_pair" "deployer" {
  key_name   = "deplyr-key"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = local.common_tag
}

output ec2 {
  value       = aws_instance.web.public_ip
}
