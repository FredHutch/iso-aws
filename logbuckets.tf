resource "random_string" "bucketrandom" {
  length  = 30
  upper   = false
  lower   = true
  number  = true
  special = false
}

variable "albbucketname" {
type = "string"
description = "The name of the ALB logs bucket"
}

/*
variable "flow-logs-bucket_name" {
type = "string"
description = "The name of the flow logs bucket"
}
*/

data "aws_elb_service_account" "main" {}



resource "aws_s3_bucket" "alb-bucket" {
    bucket = "alb-${random_string.bucketrandom.result}"
    acl = "private"


  policy = <<POLICY
{
  "Id": "Policy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::alb-${random_string.bucketrandom.result}/*",
      "Principal": {
        "AWS": [
          "${data.aws_elb_service_account.main.arn}"
        ]
      }
    }
  ]
}
POLICY

  tags {
    Name        = "ALB bucket"
  }


}
/*

resource = "aws_s3_bucket" "flow-bucket" {
    bucket = "{$var.flow-logs-bucket_name}"
    acl = "private"
}
*/
