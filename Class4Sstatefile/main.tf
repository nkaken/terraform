resource "aws_key_pair" "deployer" {
    key_name = "deployer-key1"
    public_key = file("~/.ssh/id_rsa.pub")
    tags = {
        team = "devops"
        env = "dev"
        name = "ng"
    }
}