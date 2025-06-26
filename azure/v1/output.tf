// Output After Run
output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.main.id
  sensitive   = true
}

output "vnet_name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.main.name
}

output "subnet_id" {
  description = "Subnet ID"
  value       = azurerm_subnet.main.id
}

output "vm_ips" {
  description = "VM private IPs"
  value = {
    for vm in azurerm_linux_virtual_machine.vm-be :
    vm.name => vm.private_ip_address
  }
}
