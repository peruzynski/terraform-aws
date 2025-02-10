terraform {
  backend "s3" {
    bucket         = "nebo-wiadro1"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
#    dynamodb_table = "terraform-state-lock"
    acl            = "private"
  }
}