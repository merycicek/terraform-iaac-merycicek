resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main1.id}"
}


# resource "aws_nat_gateway" "gw" {
#   allocation_id = "${aws_eip.nat.id}"
#   subnet_id     = "${aws_subnet.public[1].id}"
# }