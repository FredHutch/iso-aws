variable "alb_name" {
type = "string"
description = "The ARN of the ALB"
}


resource "aws_wafregional_web_acl_association" "foo1" {
  resource_arn =  "{$var.alb_name}"
  web_acl_id = "${aws_cloudformation_stack.owasp-cf.outputs["wafWebACL"]}"
}
