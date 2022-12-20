module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "ndc-vpc-dev"
  cidr = "172.31.0.0/16"

  azs = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"]

  private_subnets = [
    "172.31.1.0/24",
    "172.31.2.0/24",
    "172.31.3.0/24"]
    
  public_subnets = [
    "172.31.101.0/24",
    "172.31.102.0/24",
    "172.31.103.0/24"]

  enable_vpn_gateway = false

  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support = true
  
  tags = {
    Environment = "Dev"
  }
}

  resource "aws_route53_zone" "internal" {
  name = "activemq.asg"
  }