terraform {
  backend "s3" {
    bucket = "yhoiseth-terraform-example-state"
    key = "global/s3/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

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

output "s3_bucket_arn" {
  value = "${aws_s3_bucket.terraform_state.arn}"
}
