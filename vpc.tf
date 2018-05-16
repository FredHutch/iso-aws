variable "vpc_name" {
type = "string"
description = "The name of the VPC"
}


variable "vpc_cidr_block" {
type = "string"
description = "The VPC CIDR block"
}


resource "aws_vpc" "myvpc" {
tags {
    Name = "${var.vpc_name}"
  }

cidr_block = "${var.vpc_cidr_block}"
}





