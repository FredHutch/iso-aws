

module "s3-log-storage" {
  source  = "cloudposse/s3-log-storage/aws"
  version = "0.2.0"
  name =  "alb-log-bucket"
  namespace = "alb-logs"
  stage = "test"
  acl = "log-delivery-write"
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
      "Resource": "arn:aws:s3:::alb-logs-test-alb-log-bucket/*",
      "Principal": {
        "AWS": [
          "${data.aws_elb_service_account.main.arn}"
        ]
      }
    }
  ]
}
POLICY

  # insert the 3 required variables here
}
































