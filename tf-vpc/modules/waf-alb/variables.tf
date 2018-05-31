variable "alb_arn" {
 description = "the unique arn of the load balancer"
 type = "string"
}

variable "bad-ips" {
  description = "range of IP addresses to block"
  type = "string"
  default= "192.9.0.0/24"
}
