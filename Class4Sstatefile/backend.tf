terraform {
  backend "s3" {
    bucket = "mytf-backup-1"
    key    = "limon/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "lock-state"
  }
}
