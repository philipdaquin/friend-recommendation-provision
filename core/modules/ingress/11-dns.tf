
# resource "aws_acm_certificate" "api" {
#     domain_name = "api.philipdaquin.com"
#     validation_method = "DNS"
# }

data "aws_route53_zone" "public" {
    name = "philipdaquin.com"
    private_zone = false
}


resource "aws_route53_record" "web" {
    zone_id = data.aws_route53_zone.public.zone_id
    name = "service-a"
    type = "CNAME"
    ttl = 300
    // Loadbalancer dns name
    records = ["18.0.0.0.0"]
}   