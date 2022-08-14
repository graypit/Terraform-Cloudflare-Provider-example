data "cloudflare_zone" "myzone" {
  name = var.cloudflare_zone_name
}

resource "cloudflare_record" "terraform" {
  for_each = toset(var.cloudflare_zone_records)
  zone_id  = data.cloudflare_zone.myzone.id
  name     = each.key
  value    = (each.key != "www") ? var.cloudflare_zone_records_load_balancer_ip : var.cloudflare_zone_name
  type     = (each.key != "www") ? "A" : "CNAME"
  ttl      = "1"
  proxied  = true

  lifecycle {
    # Precondition in order to check availability of your zone (Domain) on Cloudflare
    precondition {
      condition     = data.cloudflare_zone.myzone.status == "active"
      error_message = "The given zone name is not active"
    }
  }
}

resource "cloudflare_zone_settings_override" "terraform" {
  zone_id = data.cloudflare_zone.myzone.id
  settings {
    ssl                      = "flexible"
  }
  
  lifecycle {
    # Precondition in order to check availability of your zone (Domain) on Cloudflare
    precondition {
      condition     = data.cloudflare_zone.myzone.status == "active"
      error_message = "The given zone name is not active"
    }
  }
}