resource "aws_acm_certificate" "api" {
    domain_name = "api.friend-recommendation.com"
    validation_method = "DNS"
}

// YOU MUST HAVE THIS REGISTERED AT YOUR ACCOUNT
data "aws_route53_zone" "public" {
    name = "friend-recommendation.com"
    private_zone = false
}   

// DNS validation with Route 53
resource "aws_route53_record" "api_validation" {
    
    for_each = {
        for dvo in aws_acm_certificate.api.domain_validation_options : dvo.domain_name => {
            name   = dvo.resource_record_name
            record = dvo.resource_record_value
            type   = dvo.resource_record_type
        }
  }

    allow_overwrite = true
    name = each.value.name
    records = [each.value.record]
    ttl = 60 
    type = each.value.type
    zone_id = data.aws_route53_zone.public.zone_id

}

resource "aws_acm_certificate_validation" "example" {
  certificate_arn         = aws_acm_certificate.api.arn
  validation_record_fqdns = [for record in aws_route53_record.api_validation : record.fqdn]
}