# === OUTPUTS DE LA INFRAESTRUCTURA ===

# Información de conexión de la VM
output "public_ip_address" {
  value       = azurerm_public_ip.main.ip_address
  description = "IP pública para conectarse a la VM"
}

output "vm_name" {
  value       = azurerm_windows_virtual_machine.main.name
  description = "Nombre de la máquina virtual"
}

output "admin_username" {
  value       = azurerm_windows_virtual_machine.main.admin_username
  description = "Usuario administrador de la VM"
}

output "rdp_connection_command" {
  value       = "mstsc /v:${azurerm_public_ip.main.ip_address}"
  description = "Comando para conectarse por RDP desde Windows"
}

# Información del Resource Group
output "resource_group_name" {
  value       = azurerm_resource_group.main.name
  description = "Nombre del grupo de recursos"
}

output "location" {
  value       = azurerm_resource_group.main.location
  description = "Región de Azure donde están los recursos"
}

# Información de red
output "vnet_name" {
  value       = azurerm_virtual_network.main.name
  description = "Nombre de la red virtual"
}

output "subnet_id" {
  value       = azurerm_subnet.main.id
  description = "ID de la subnet"
}

output "nsg_name" {
  value       = azurerm_network_security_group.main.name
  description = "Nombre del Network Security Group"
}

# Información completa de conexión
output "connection_info" {
  value = {
    ip_address = azurerm_public_ip.main.ip_address
    username   = azurerm_windows_virtual_machine.main.admin_username
    port       = "3389"
    protocol   = "RDP"
  }
  description = "Información completa para conectarse a la VM"
}
