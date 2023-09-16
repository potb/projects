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

module "website" {
  source = "./terraform/modules/project"

  cloudflare_api_token = var.cloudflare_api_token
  name                 = "website"
  dns_record_name      = "@"
}

module "prout" {
  source = "./terraform/modules/project"

  cloudflare_api_token = var.cloudflare_api_token
  name                 = "prout"
  extra_dns_config     = {
    config = {
      zone            = "prout.dev"
      type            = "CNAME"
      name            = "@"
      dns_record_name = "prout.dev"
    }

  }
}

module "aahh" {
  source = "./terraform/modules/project"

  cloudflare_api_token = var.cloudflare_api_token
  name                 = "aahh"
  extra_dns_config     = {
    config = {
      zone            = "aahh.dev"
      type            = "CNAME"
      name            = "@"
      dns_record_name = "aahh.dev"
    }

  }
}
