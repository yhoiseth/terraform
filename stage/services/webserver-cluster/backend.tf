terraform {
  backend "s3" {
    bucket = "yhoiseth-terraform-example-state"
    key = "stage/services/webserver-cluster/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
