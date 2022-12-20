module "myip" {
  source  = "jameswoolfenden/ip/http"
  version = "0.2.7"
}

module "grafana" {
//  source              = "github.com/solringair/terraform-grafana?ref=v1.0.1"
  source              = "../"
  instance_type       = "m5.large"
  subnet_ids          = module.vpc.public_subnets
//  private_ips         = local.private_ips
  allowed_ranges      = [module.myip.cidr, module.vpc.vpc_cidr_block]
  ssh-inbound-range   = [module.myip.cidr]
  vpc_id              = module.vpc.vpc_id
}