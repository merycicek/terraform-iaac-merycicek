resource "aws_instance" "web" {
  ami           = "ami-06ce3edf0cff21f07"
  instance_type = "t2.micro"


  key_name = "${aws_key_pair.ec2-ireland1.key_name}"
  security_groups = ["${aws_security_group.allow_tls.name}"]


  tags = {
    Name = "HelloWorld1"
  }
}