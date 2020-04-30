resource "aws_security_group" "allow_tls" {
  name        = "task3_terraform"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "task3_terraform"
  }
}
resource "aws_ebs_volume" "web" {
  availability_zone = "us-west-2a"
  size              = 100
  tags = {
    Name = "HelloWorld"
  }
}
variable "data_volume_device_list" {
    description = "device list for EC2 mapping"
    type        = "list"
   default     = ["/dev/sdf", "/dev/sdg", "/dev/sdh", "/dev/sdi"]
  }
resource "aws_volume_attachment" "web_data_vol_att" {
  device_name = "${element(var.data_volume_device_list, count.index )}"
  volume_id   = "${element(aws_ebs_volume.web.*.id, count.index)}"
  instance_id = "${element(aws_instance.web.*.id, count.index)}"
}
resource "aws_route53_record" "www" {
  zone_id = "Z049827916KCYTT0YP07G"
  name    = "www.real.indianagulu.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.web.public_ip}"]
}