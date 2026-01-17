resource "azurerm_resource_group" "main" {
  name     = "${local.prefix}-rg"
  location = local.az_location

  tags = local.tags
}
