provider "azurerm" {
  features {}
  subscription_id = "a9bc3c93-b459-4ffb-8364-38ff9554f652"
}

resource "azurerm_storage_account" "golive" {
  name = "goliveroboshop" # must be globally unique & lowercase
  resource_group_name      = "golive"
  location                 = "UK West"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "golivecontainer"
  storage_account_id    = azurerm_storage_account.golive.id
  container_access_type = "private"
}

terraform {
  backend "azurerm" {
    #tenant_id                  = "00000000-0000-0000-0000-000000000000"
    subscription_id      = "a9bc3c93-b459-4ffb-8364-38ff9554f652"
    resource_group_name  = "golive"
    storage_account_name = "goliveroboshop"
    container_name       = "golivecontainer"
    key                  = "prod.terraform.tfstate"
  }
}
