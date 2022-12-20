# resource "aws_route53_zone" "link-public-zone" {
#   name                     = var.domain_link
# }

#resource "aws_route53_record" "cname_route53_record" {
#  zone_id = aws_route53_zone.link-public-zone.zone_id
#  name    = "example.com"
#  type    = "CNAME"
#  ttl     = "60"
#  records = aws_elb.elb.dns_name
#}