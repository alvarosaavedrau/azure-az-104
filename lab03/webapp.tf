resource "azurerm_service_plan" "main" {
  name                = "${local.prefix}-asp"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  os_type             = "Linux"
  sku_name            = "F1" # Minimum for deployment slots is S1

  tags = local.tags
}

resource "azurerm_linux_web_app" "main" {
  name                = "${local.prefix}-webapp"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_service_plan.main.location
  service_plan_id     = azurerm_service_plan.main.id

  site_config {
    always_on = false
    application_stack {
      python_version = "3.12"
    }
  }

  tags = local.tags
}

# resource "azurerm_linux_web_app_slot" "main" {
#   name           = "staging"
#   app_service_id = azurerm_linux_web_app.main.id

#   site_config {}

#   tags = local.tags
# }