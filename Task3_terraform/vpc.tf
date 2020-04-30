resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
    count = 3
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "10.0.${count.index +1}.0/24"
}

resource "aws_subnet" "public" {
    count = 3
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "10.0.10${count.index +1}.0/24"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"
}


# resource "aws_nat_gateway" "gw" {
#   allocation_id = "${aws_eip.nat.id}"
#   subnet_id     = "${aws_subnet.public[1].id}"
# }

resource "aws_eip" "nat" {
  vpc      = true
}





resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table_association" "public" {
  count = "${length(var.subnet_cidrs_public)}"

  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}