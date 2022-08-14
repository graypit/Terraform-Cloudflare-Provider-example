output "zone_status" {
  value       = data.cloudflare_zone.myzone.status
}

output "record" {
  value = values(cloudflare_record.terraform)[*].hostname
}

output "metadata" {
  value       = values(cloudflare_record.terraform)[*].metadata
  sensitive   = true
}