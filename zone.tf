resource "cloudflare_zone" "monster" {
  zone       = "fabio.monster"
}

resource "cloudflare_record" "www" {
  zone_id = cloudflare_zone.monster.id
  name    = "www"
  value   = "192.168.0.11"
  type    = "A"
  ttl     = 1
  # proxied = true
}

# strict SSL

resource "cloudflare_zone_settings_override" "monster-settings" {
  zone_id = cloudflare_zone.monster.id

  settings {
    tls_1_3                  = "on"
    automatic_https_rewrites = "on"
    ssl                      = "strict"
  }
}