provider "aws" {
  region     = "eu-west-2"
  access_key = "AKIAYJK4MRV6REWAX465"
  secret_key = "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"
}
resource "aws_instance" "AS" {
  ami           = "ami-03e88be9ecff64781"
  instance_type = "t2.micro"
  tags = {
    Maintainer = "anasa@ciklum.com"
    Name       = "AS"
  }
}
