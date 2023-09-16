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

variable "dns_record_name" {
  description = "The DNS record name"
  type        = string
  default     = null

  validation {
    condition     = var.dns_record_name != null ? length(var.dns_record_name) > 0 : true
    error_message = "The DNS record name cannot be empty"
  }
}

variable "extra_dns_config" {
  description = "Some non standard zone configuration"
  type        = map(object({
    zone            = string
    type            = string
    name            = string
    dns_record_name = string
  }))
  default = {}
}
