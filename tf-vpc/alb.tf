
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "3.4.0"
  load_balancer_name = "test-alb"
  security_groups = ["${module.allow_web.this_security_group_id}"]
  subnets = ["${module.vpc.public_subnets}"] 
  vpc_id = "{$vpc.id}"
  logging_enabled = "true"
  log_bucket_name = "${module.s3-log-storage.bucket_id}"

}


