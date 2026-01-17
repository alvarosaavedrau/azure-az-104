# Permisos para el Application Gateway Ingress Controller (AGIC)
# El AGIC addon necesita permisos para leer y gestionar el Application Gateway

# Obtener la identidad del AGIC addon
data "azurerm_user_assigned_identity" "agic" {
  name                = "ingressapplicationgateway-${azurerm_kubernetes_cluster.main.name}"
  resource_group_name = azurerm_kubernetes_cluster.main.node_resource_group

  depends_on = [azurerm_kubernetes_cluster.main]
}

# Asignar rol "Contributor" en el Application Gateway para que AGIC pueda gestionarlo
resource "azurerm_role_assignment" "agic_appgw_contributor" {
  scope                = azurerm_application_gateway.main.id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_user_assigned_identity.agic.principal_id
}

# Asignar rol "Reader" en el Resource Group para que AGIC pueda leer recursos
resource "azurerm_role_assignment" "agic_rg_reader" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Reader"
  principal_id         = data.azurerm_user_assigned_identity.agic.principal_id
}

# Asignar rol "Managed Identity Operator" en el Resource Group del nodo
# Esto permite que AGIC gestione su propia identidad
resource "azurerm_role_assignment" "agic_identity_operator" {
  scope                = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${azurerm_kubernetes_cluster.main.node_resource_group}"
  role_definition_name = "Managed Identity Operator"
  principal_id         = data.azurerm_user_assigned_identity.agic.principal_id

  depends_on = [azurerm_kubernetes_cluster.main]
}

# Asignar rol "Network Contributor" en la VNet para que AGIC pueda hacer join en la subnet
# resource "azurerm_role_assignment" "agic_vnet_network_contributor" {
#   scope                = azurerm_virtual_network.main.id
#   role_definition_name = "Network Contributor"
#   principal_id         = data.azurerm_user_assigned_identity.agic.principal_id
# }
