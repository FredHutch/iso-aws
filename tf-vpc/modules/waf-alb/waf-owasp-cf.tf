
resource "aws_cloudformation_stack" "owasp-cf" {
  name = "owasp-top10"

  parameters {
    stackScope = "Regional"
  }


  template_url = "https://s3.us-east-2.amazonaws.com/awswaf-owasp/owasp_10_base.yml"



}
