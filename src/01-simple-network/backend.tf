terraform {
  backend "azurerm" {
    resource_group_name  = "rg-network-terraform-backends-tiancong"
    storage_account_name = "terraformbackends01tc"
    container_name       = "tfstates-network"
    key                  = "01-simple-network.tfstate"
  }
}