terraform {
  backend "azurerm" {
    resource_group_name  = "rg-network-terraform-backends"
    storage_account_name = "terraformbackends012"
    container_name       = "tfstates-network"
    key                  = "01-simple-network.tfstate"
  }
}