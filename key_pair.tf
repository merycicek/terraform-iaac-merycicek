resource "aws_key_pair" "ec2-ireland" {
  key_name   = "ec2-ireland"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

  
}