variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type        = string
}

variable "name" {
  description = "Name of the project"
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "The project name cannot be empty"
  }
}

variable "account_id" {
  description = "The Cloudflare account ID"
  type        = string

  validation {
    condition     = length(var.account_id) > 0
    error_message = "The Cloudflare account ID cannot be empty"
  }
}

variable "dns_record_name" {
  description = "The DNS record name"
  type        = string

  validation {
    condition     = length(var.dns_record_name) > 0
    error_message = "The DNS record name cannot be empty"
  }
}