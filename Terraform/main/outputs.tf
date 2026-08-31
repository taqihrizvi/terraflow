output "resource_group_name" { value = module.resource_group.name }
output "vm_name" { value = var.vm_name }
output "public_ip" { value = module.networking.public_ip }
output "dns_name" { value = var.dns_name }
output "dns_zone_name" { value = local.dns_zone_name }
output "vm_fqdn" { value = "${var.dns_name}.${local.dns_zone_name}" }
output "admin_username" { value = var.admin_username }
output "admin_password" {
  value     = module.security.admin_password
  sensitive = true
}
output "dns_zone_name_servers" { value = module.dns.name_servers }
