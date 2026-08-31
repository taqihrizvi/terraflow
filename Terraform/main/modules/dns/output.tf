output "dns_record_name" { value = azurerm_dns_a_record.vm_dns.name }
output "dns_record_ip" { value = one(azurerm_dns_a_record.vm_dns.records) }
output "name_servers" { value = azurerm_dns_zone.zone.name_servers }
