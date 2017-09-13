provider "aws" {
  region = "us-east-1"
  version = "~> 0.1"
}

resource "aws_instance" "example" {
  ami = "ami-40d28157"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  tags {
    Name = "terraform-example"
  }

  user_data = <<-EOF
              #!/bin/bash
              echo 'Hello, World!' > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
}
