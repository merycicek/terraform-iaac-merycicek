resource "aws_ebs_volume" "web" {
  availability_zone = "us-east-2a"
  size              = 100
   tags = {
    Enviroment = "Dev"
    Department = "IT"
    Team = "infrastructure"
    Created_by = "Meryem"
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
