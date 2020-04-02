###Setting up subdomain for the ptfe project
resource "aws_route53_record" "ptfe" {
  zone_id = var.r53-zone-id
  name    = var.domain-name
  type    = "A"
  ttl     = "60"
  records = ["${aws_eip.ptfe-eip.public_ip}"]
}


###Linking static subdomain with the dynamic DB address  
resource "aws_route53_record" "db" {
  zone_id = var.r53-zone-id
  name    = var.db-domain-name
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_db_instance.ptfe-db.address}"]
}

