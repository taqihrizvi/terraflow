locals {
  name_prefix   = lower(replace(var.vm_name, " ", "-"))
  dns_zone_name = "fusion.crbc.live"
  common_tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
