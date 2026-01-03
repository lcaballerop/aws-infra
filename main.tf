provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"] # Official Amazon Linux

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t3.micro"

  tags = {
    Name = "learn-terraform"
  }
}
