resource "aws_route53_record" "www" {
  zone_id = "Z02550487Q5F0WF6SP6V"
  name    = "www.pacikamerycicek.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.web.public_ip}"]

   tags = {
    Enviroment = "Dev"
    Department = "IT"
    Team = "infrastructure"
    Created_by = "Meryem"
  }
}