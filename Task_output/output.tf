provider "aws" {
  region = "eu-west-1"
  version = "2.59"
}

// Creates Key
resource "aws_key_pair" "ec2-ireland3" {
  key_name   = "meryems_terra_key3"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

  
}
// Creates Instance
resource "aws_instance" "web-output" {
  ami           = "ami-06ce3edf0cff21f07"
  instance_type = "t2.micro"
}
// Creates sec group

resource "aws_security_group" "allow_tls" { 
name = "terraform_task" 
  
}
resource "aws_route53_record" "www"{
 zone_id = "Z05078902NX01H5WLBV6I" 
 name = "merycicek.com"  
 type    = "NS"
 ttl = "3"
 record = "${aws_instance.web-output.public_ip}"
     
}


// Outputs everythings

output "key_pair" {
  value = "${aws_key_pair.ec2-ireland3.key_name}"
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
   value = " login to wordpress and reset passwd "
 }


