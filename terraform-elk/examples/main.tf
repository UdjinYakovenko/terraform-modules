module "elk" {
//  source              = "github.com/solringair/terraform-elk"
  source              = "../"
  instance_type       = "m5.large"
  subnet_ids          = module.vpc.public_subnets
//  private_ips         = local.private_ips
  allowed_ranges      = [module.myip.cidr, module.vpc.vpc_cidr_block]
  ssh-inbound-range   = [module.myip.cidr]
  vpc_id              = module.vpc.vpc_id
}