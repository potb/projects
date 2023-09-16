terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

data "cloudflare_accounts" "account_data" {}

data "cloudflare_zone" "potb_dev" {
  name = "potb.dev"
}

data "cloudflare_zone" "extra" {
  for_each = var.extra_dns_config

  name = each.value.zone
}

locals {
  accounts = {
    for account in data.cloudflare_accounts.account_data.accounts : account.name => account.id
  }
  zone_name  = data.cloudflare_zone.potb_dev.name
  name       = coalesce(var.dns_record_name, var.name)
  domain     = local.name == "@" ? local.zone_name : "${local.name}.${local.zone_name}"
  account_id = local.accounts["potb"]
}

resource "cloudflare_pages_project" "project" {
  account_id = local.account_id

  name              = var.name
  production_branch = "production"
}

resource "cloudflare_record" "project_record" {
  zone_id = data.cloudflare_zone.potb_dev.id
  name    = local.name
  value   = cloudflare_pages_project.project.subdomain
  type    = "CNAME"

  proxied = true
}

resource "cloudflare_pages_domain" "project_domain" {
  depends_on = [cloudflare_record.project_record]

  account_id   = local.account_id
  project_name = cloudflare_pages_project.project.name
  domain       = local.domain
}


resource "cloudflare_pages_domain" "extra_domains" {
  for_each = var.extra_dns_config

  account_id   = local.account_id
  project_name = cloudflare_pages_project.project.name
  domain       = each.value.dns_record_name
}

resource "cloudflare_record" "extra_records" {
  for_each   = var.extra_dns_config
  depends_on = [cloudflare_pages_domain.extra_domains]

  zone_id = data.cloudflare_zone.extra[each.key].id
  name    = each.value.name
  value   = cloudflare_pages_project.project.subdomain
  type    = each.value.type

  proxied = true
}
