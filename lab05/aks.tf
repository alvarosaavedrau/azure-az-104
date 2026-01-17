resource "azurerm_kubernetes_cluster" "main" {
  name                = "${local.prefix}-aks"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "${local.prefix}-aks"
  kubernetes_version  = "1.33.5"

  # Configuración económica - SKU gratuito
  sku_tier = "Free"

  # Pool de nodos por defecto - configuración mínima y económica
  default_node_pool {
    name                 = "default"
    node_count           = 1
    vm_size              = "Standard_B2s" # VM económica
    vnet_subnet_id       = azurerm_subnet.aks.id
    auto_scaling_enabled = false

    # Sin zonas de disponibilidad para reducir costos
    zones = []
  }

  # Identidad administrada del sistema
  identity {
    type = "SystemAssigned"
  }

  # Configuración de red
  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    service_cidr      = "10.2.0.0/16"
    dns_service_ip    = "10.2.0.10"
    load_balancer_sku = "standard"
  }

  # Configuración de Application Gateway Ingress Controller (AGIC)
  ingress_application_gateway {
    gateway_id = azurerm_application_gateway.main.id
  }

  tags = local.tags

  depends_on = [azurerm_application_gateway.main]

  lifecycle {
    ignore_changes = [default_node_pool]
  }
}
