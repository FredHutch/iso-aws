module "waf-alb" {
  source = "modules/waf-alb"

  alb_arn = "${module.alb.load_balancer_id}"
}
