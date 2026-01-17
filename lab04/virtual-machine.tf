resource "random_password" "admin_password" {
  length  = 16
  special = true
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = "${local.prefix}-vm"
  computer_name                   = "linuxvm01"
  resource_group_name             = azurerm_resource_group.main.name
  location                        = azurerm_resource_group.main.location
  size                            = "Standard_B1s"
  patch_mode                      = "AutomaticByPlatform"
  disable_password_authentication = true
  admin_username                  = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = local.tags
}
