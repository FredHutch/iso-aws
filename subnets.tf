variable "vpc_region" {
type = "string"
description = "The VPC region"
}


variable "subnet_cidr_block_pub1" {
type = "string"
description = "The first public block"
}

variable "subnet_cidr_block_pub2" {
type = "string"
description = "The second public block"
}

variable "subnet_cidr_block_pub3" {
type = "string"
descripton = "The third public block"
}


variable "subnet_cidr_block_pri1" {
type = "string"
description = "The first private block"
}

variable "subnet_cidr_block_pri2" {
type = "string"
description = "The second private block"
}

variable = "subnet_cidr_block_pri3" {
type = "string"
description = "The third private block"
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

resource "aws_subnet" pu
