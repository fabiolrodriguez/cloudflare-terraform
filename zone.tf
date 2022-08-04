resource "cloudflare_zone" "monster" {
  zone       = "fabio.monster"
}

resource "cloudflare_record" "www" {
  zone_id = cloudflare_zone.monster.id
  name    = "www"
  value   = "192.168.0.11"
  type    = "A"
  ttl     = 3600
}