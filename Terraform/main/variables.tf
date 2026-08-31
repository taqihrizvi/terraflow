variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group to create"
}

variable "vm_name" {
  type        = string
  description = "Name of the Windows VM (max 15 characters). VNet and NSG use this same name."
}

variable "dns_name" {
  type        = string
  description = "DNS hostname (A record) only, not the FQDN"
}

variable "subscription_id" { type = string }

variable "environment" {
  type    = string
  default = "dev"
}

variable "location" {
  type    = string
  default = "UK South"
}

variable "vm_size" {
  type    = string
  default = "Standard_B2als_v2"
}

variable "admin_username" {
  type    = string
  default = "azureadmin"
}
