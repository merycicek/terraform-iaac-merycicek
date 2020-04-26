resource "aws_key_pair" "ec2-London" {
  key_name   = "ec2-London-terraform"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

  
}