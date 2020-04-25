provider "aws" {
  region = "us-east-1"
}
resource "aws_key_pair" "ec2-ireland" {
  key_name   = "ec2-ireland"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCniF2EKOu2N2U5CtjwPKGfQRnVN1sHisyVGel6vUK2busytBsCMe66i6/cUYUrBakjvYA+k5pVYbvSGhzP8U53nmwX+1eRt9Vmsy0wQvrC74oJK1SIEYXnKZpdMZygAWadq/wM2I7Fym6bclbgcWmeh8PdZpOaxRRacg1kw6T5SBHdHAq8oXm5QSo48UGWP24hRAaQn6ljoHozQ5pchOvNK/ugXzXvmgUtvtzmfeK5vswtF3DnJFoacX7/LU4hq9d6qisORFCdakJsV+AoJrAn7eMR/IuCKpEZMzUjdpt5IcKBXKr3Br9OKv/lPNiJ+DqazQNMHWSvX6wnc7puvBU3 ec2-user@ip-172-31-41-203.eu-west-1.compute.internal"
}

resource "aws_instance" "web" {
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"


  key_name = "${aws_key_pair.ec2-ireland.key_name}"

  tags = {
    Name = "HelloWorld"
  }
}
resource "aws_security_group" "allow_tls" {
  name        = "first_terraform"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0dca0e74a352343a4"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "first_terraform"
  }
}