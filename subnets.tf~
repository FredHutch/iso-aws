variable "subnet_cidr_block1" {
type = "string"
description = "The first block"
}

variable "subnet_cidr_block2" {
type = "string"
description = "The second block"
}


resource "aws_subnet" "public1" {
  vpc_id            = "${aws_vpc.myvpc.id}"
  availability_zone = "us-west-2a"
  cidr_block        = "${var.subnet_cidr_block1}"
}

resource "aws_subnet" "public2" {
  vpc_id            = "${aws_vpc.myvpc.id}"
  availability_zone = "us-west-2b"
  cidr_block        = "${var.subnet_cidr_block2}"
}
