output "name" {
  value = "meryem"
}
output "lastname" {
  value = "Elibal"
}
resource "aws_key_pair" "ec2-ireland2" {
  key_name   = "meryems_terra_key2"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

output "key_name" {
  value = "${aws_key_pair.ec2-ireland2.key_name}"
}
output "actual_key" {
  value = "${aws_key_pair.ec2-ireland2.public_key}"
}