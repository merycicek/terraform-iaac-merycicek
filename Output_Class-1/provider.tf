provider "aws" {
  region = "eu-west-1"
  version = "2.59"
}

// Creates Key
resource "aws_key_pair" "ec2-ireland2" {
  key_name   = "meryems_terra_key2"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

  
}
// Creates Instance
resource "aws_instance" "web-output" {
  ami           = "ami-06ce3edf0cff21f07"
  instance_type = "t2.micro"
}


// Creates sec group


// Creates Route53


// Outputs everythings

output "key_pair" {
  value = "${aws_key_pair.ec2-ireland2.key_name}"
}

output "instance_id" {
  value = "${aws_instance.web-output.id}"
}
 output "instance_arn"{
   value = "${aws_instance.web-output.arn}"
 }

 output "instance_ip" {
   value = "${aws_instance.web-output.public_ip}"
 }
 output "my_message" {
   value = "Please login and change your passwd "
 }


