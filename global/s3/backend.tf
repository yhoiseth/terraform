terraform {
  backend "s3" {
    bucket = "yhoiseth-terraform-example-state"
    key = "global/s3/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
