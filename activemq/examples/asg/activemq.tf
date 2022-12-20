module "activemq" {
  source = "../../"

  ami_id = data.aws_ami.activemq_ami.id
  key_name = aws_key_pair.aws_key.key_name
  vpc_id = module.vpc.vpc_id
  security_groups = [module.vpc.default_security_group_id]
  route53_host = "activemq.activemq.asg"
  route53_zone = aws_route53_zone.internal.zone_id
  av_zone_a = "eu-west-1a"
  av_zone_b = "eu-west-1b"
  av_zone_c = "eu-west-1c"
  instance_type = "t3.large"
  name_prefix = "test"
}