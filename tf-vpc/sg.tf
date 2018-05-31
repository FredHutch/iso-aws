module "allow_web" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "web-service"
  description = "Security group for user-service with standard web ports open customa ports open" 
  vpc_id      = "${module.vpc.vpc_id}"

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["https-443-tcp", "http-80-tcp"]
}



