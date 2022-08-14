variable "cloudflare_email" {
  type        = string
  default     = "graypit@gmail.com"
  description = "Clouflare email address"
}

variable "cloudflare_api_key" {
  type        = string
  default     = "111222333444555666777888999000"
  description = "Cloudflare api token"
}

variable "cloudflare_zone_name" {
  type        = string
  default     = "yoursite.com"
  description = "Cloudflare zone name it is your domain name"
}

variable "cloudflare_zone_records" {
  description = "A Records that will be added"
  type        = list(string)
  default     = [
    "@", // for root dn
    "api",
    "www",
  ]
}

variable "cloudflare_zone_records_load_balancer_ip" {
  description = "A Reverse Proxy Load Balancer IP address - for the DNS Records"
  type        = string
  default     = "161.97.100.200"
}
