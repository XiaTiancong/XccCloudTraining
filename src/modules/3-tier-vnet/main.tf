#main.tf
resource "azurerm_virtual_network" "main" {
  name                = "vnet-one"
  resource_group_name = var.group
  location            = var.location
  address_space       = var.address_space
}


resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = var.group
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.0/24"]

  delegation {
    name = "acctestdelegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = var.group
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.0.0/25"]

  delegation {
    name = "acctestdelegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}