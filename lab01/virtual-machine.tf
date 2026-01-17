resource "random_password" "admin_password" {
  length  = 16
  special = true
}

# Windows Server 2025 Virtual Machine
resource "azurerm_windows_virtual_machine" "main" {
  name                = "${local.prefix}-vm"
  computer_name       = "winvm01"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B2s"
  admin_username      = "azureadmin"
  admin_password      = random_password.admin_password.result
  patch_mode          = "AutomaticByPlatform"

  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2025-datacenter-azure-edition"
    version   = "latest"
  }

  tags = local.tags
}
