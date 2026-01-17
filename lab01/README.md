<!-- BEGIN_TF_DOCS -->
# 

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.13.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.53.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.53.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_interface.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_windows_virtual_machine.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine) | resource |
| [random_password.admin_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The Subscription ID for the Azure account. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | Usuario administrador de la VM |
| <a name="output_connection_info"></a> [connection\_info](#output\_connection\_info) | Información completa para conectarse a la VM |
| <a name="output_location"></a> [location](#output\_location) | Región de Azure donde están los recursos |
| <a name="output_nsg_name"></a> [nsg\_name](#output\_nsg\_name) | Nombre del Network Security Group |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | IP pública para conectarse a la VM |
| <a name="output_rdp_connection_command"></a> [rdp\_connection\_command](#output\_rdp\_connection\_command) | Comando para conectarse por RDP desde Windows |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Nombre del grupo de recursos |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | ID de la subnet |
| <a name="output_vm_name"></a> [vm\_name](#output\_vm\_name) | Nombre de la máquina virtual |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | Nombre de la red virtual |
<!-- END_TF_DOCS -->