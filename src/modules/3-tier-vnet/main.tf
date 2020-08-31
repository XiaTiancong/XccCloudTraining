#main.tf
resource "azurerm_virtual_network" "main" {
  name                = "vnet-one"
  resource_group_name = var.group
  location            = var.location
  address_space       = var.address_space
}