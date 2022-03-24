provider "aws" {
  region     = "eu-west-2"
  access_key = "-"
  secret_key = "-"
}
resource "aws_instance" "AS" {
  ami           = "ami-03e88be9ecff64781"
  instance_type = "t2.micro"
  tags = {
    Maintainer = "anasa@ciklum.com"
    Name       = "AS"
  }
}
