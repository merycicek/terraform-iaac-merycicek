resource "aws_key_pair" "us-west-2_tf" {
  key_name   = "tf_task1_key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

  
}