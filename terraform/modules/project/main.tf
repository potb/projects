terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

data "cloudflare_zone" "potb_dev" {
  name = "potb.dev"
}

locals {
  domain = var.dns_record_name == "@" ? data.cloudflare_zone.potb_dev.name : "${var.dns_record_name}.${data.cloudflare_zone.potb_dev.name}"
}

resource "cloudflare_pages_project" "website" {
  account_id = var.account_id

  name              = var.name
  production_branch = "production"
}

resource "cloudflare_pages_domain" "website_domain" {
  account_id   = var.account_id
  project_name = cloudflare_pages_project.website.name
  domain       = local.domain
}

resource "cloudflare_record" "website_record" {
  zone_id = data.cloudflare_zone.potb_dev.id
  name    = var.dns_record_name
  value   = cloudflare_pages_project.website.subdomain
  type    = "CNAME"

  proxied = true
}