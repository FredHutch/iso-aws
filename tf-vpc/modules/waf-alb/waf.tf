resource "aws_wafregional_ipset" "ipset" {
  name = "tfIPSet"

  ip_set_descriptor {
    type  = "IPV4"
    value = "192.0.7.0/24"
  }
}

resource "aws_wafregional_rule" "wafrule" {
  depends_on  = ["aws_wafregional_ipset.ipset"]
  name        = "tfWAFRule"
  metric_name = "tfWAFRule"

  predicate {
    data_id = "${aws_wafregional_ipset.ipset.id}"
    negated = false
    type    = "IPMatch"
  }
}



resource "aws_wafregional_web_acl" "waf_acl" {
  depends_on  = ["aws_wafregional_ipset.ipset", "aws_wafregional_rule.wafrule"]
  name        = "tfWebACL"
  metric_name = "tfWebACL"

  default_action {
    type = "ALLOW"
  }

  rule {
    action {
      type = "BLOCK"
    }

    priority = 1
    rule_id  = "${aws_wafregional_rule.wafrule.id}"
  }
}

resource "aws_wafregional_web_acl_association" "base" {
  resource_arn = "${var.alb_arn}"
  web_acl_id = "${aws_wafregional_web_acl.waf_acl.id}"
}

resource "aws_wafregional_web_acl_association" "base1" {
  resource_arn = "${var.alb_arn}"
  web_acl_id = "${aws_cloudformation_stack.owasp-cf.outputs["wafWebACL"]}"
}

























