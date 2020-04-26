resource "aws_key_pair" "eu-west-2" {
  key_name   = "Terraform_London_key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

  
}