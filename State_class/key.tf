resource "aws_key_pair" "us-east-1-key" {
  key_name   = "meryems_state_key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

  
}
resource "aws_instance" "web" {
    instance_type = "t2.micro"
    ami = "d6981f77-4df4-4a0b-9074-a0572d3269a2"
  # (resource arguments)
}