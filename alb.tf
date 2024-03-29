

resource "aws_alb" "test" {
  name               = "test-lb-tf"
  internal           = false
  security_groups    = ["${aws_security_group.allow_web.id}"] 
  subnets            = ["${aws_subnet.public1.id}", "${aws_subnet.public2.id}"]

  enable_deletion_protection = false



  access_logs {
    bucket  = "${aws_s3_bucket.alb-bucket.id}"
    prefix  = "test-lb"
    enabled = true
  }






  tags {
    Environment = "production"
  }
}


resource "aws_wafregional_web_acl_association" "foo" {
  depends_on  = ["aws_alb.test"]
  resource_arn = "${aws_alb.test.arn}"
  web_acl_id = "${aws_wafregional_web_acl.waf_acl.id}"
}

resource "aws_wafregional_web_acl_association" "foo1" {
  depends_on = ["aws_alb.test"]
  resource_arn = "${aws_alb.test.arn}"
  web_acl_id = "${aws_cloudformation_stack.owasp-cf.outputs["wafWebACL"]}"
}
