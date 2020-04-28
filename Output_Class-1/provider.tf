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


// Creates sec group


// Creates Route53


// Outputs everythings

output "key_pair" {
  value = "${aws_key_pair.ec2-ireland2.key_name}"
}


