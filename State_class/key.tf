resource "aws_key_pair" "us-east-1-key" {
  key_name   = "meryems_state_key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

  
}
resource "aws_instance" "web" {
    instance_type = "t2.micro"
    ami = "i-00d48151d54550b1a"
  # (resource arguments)
}