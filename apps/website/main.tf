terraform {
  required_version = ">= 1.5.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }

  cloud {
    organization = "potb"
    workspaces {
      name = "projects"
    }
  }
}

variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type        = string
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

data "cloudflare_accounts" "account_data" {}

locals {
  accounts = {
    for account in data.cloudflare_accounts.account_data.accounts : account.name => account.id
  }
}

module "website" {
  source = "./../../terraform/modules/project"

  cloudflare_api_token = var.cloudflare_api_token
  name                 = "website"
  dns_record_name      = "@"
  account_id           = local.accounts["potb"]
}
