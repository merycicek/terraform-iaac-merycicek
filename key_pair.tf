resource "aws_key_pair" "ec2-ireland1" {
  key_name   = "meryems_terra_key"
  public_key = "${file("~/.ssh/id_rsa.pub")"

  
}