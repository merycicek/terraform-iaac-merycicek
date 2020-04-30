resource "aws_route53_record" "www" {
  zone_id = "Z049827916KCYTT0YP07G"
  name    = "www.real.indianagulu.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.web.public_ip}"]
}