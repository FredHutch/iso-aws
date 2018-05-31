module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.32.0"

  name = "my-newvpc"
  cidr = "192.168.0.0/16"

  azs = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  public_subnets =  ["192.168.4.0/24", "192.168.5.0/24", "192.168.6.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false




}






