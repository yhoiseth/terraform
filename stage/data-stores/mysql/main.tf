provider "aws" {
  region = "us-east-1"
  version = "~> 0.1"
}

resource "aws_db_instance" "example" {
  name = "example_database"
  engine = "mysql"
  allocated_storage = 10
  username = "admin"
  password = "${var.db_password}"
  instance_class = "db.t2.micro"
  skip_final_snapshot = true
}
