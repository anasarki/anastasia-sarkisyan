provider "aws" {
  region                  = "eu-west-2"
  shared_credentials_file = "C:/Users/anasa/.aws/credentials"
  profile                 = "default"
}
resource "aws_instance" "AS" {
  ami                    = "ami-09a2a0f7d2db8baca"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags = {
    Maintainer = "anasa@ciklum.com"
    Name       = "AS"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    tags = {
      Maintainer = "anasa@ciklum.com"
    }
  }
}
output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}
