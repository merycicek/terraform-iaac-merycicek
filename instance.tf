resource "aws_instance" "web" {
  ami           = "ami-06ce3edf0cff21f07"
  instance_type = "t2.micro"


  key_name = "meryems_terra_key"
  security_groups = ["${aws_security_group.allow_tls.name}"]


  tags = {
    Name = "HelloWorld1"
  }
}