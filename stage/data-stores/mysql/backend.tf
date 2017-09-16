terraform {
  backend "s3" {
    bucket = "yhoiseth-terraform-example-state"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
