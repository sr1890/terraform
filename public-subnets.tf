locals {
  az_names    = "${data.aws_availability_zones.azs.names}"
  pub_sub_ids = "${aws_subnet.public.*.id}"
}

resource "aws_subnet" "public" {
  count                   = "${length(local.az_names)}"
  vpc_id                  = "${aws_vpc.my_app.id}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr, 8, count.index)}"
  map_public_ip_on_launch = true
  availability_zone       = "${local.az_names[count.index]}"
  tags = {
    Name = "PublicSubnet-${count.index + 1}"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.my_app.id}"

  tags = {
    Name = "JavaHomeIgw"
  }
}

resource "aws_route_table" "prt" {
  vpc_id = "${aws_vpc.my_app.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "JavaHomePRT"
  }
}

resource "aws_route_table_association" "public_sub_asociation" {
  count          = "${length(local.az_names)}"
  subnet_id      = "${local.pub_sub_ids[count.index]}"
  route_table_id = "${aws_route_table.prt.id}"
}
