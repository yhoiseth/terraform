provider "aws" {
  region = "us-east-1"
  version = "~> 0.1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "yhoiseth-terraform-example-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
