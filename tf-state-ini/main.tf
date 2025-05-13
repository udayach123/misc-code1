provider "azurerm" {
  features {}
  subscription_id = "a9bc3c93-b459-4ffb-8364-38ff9554f652"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "storageroboshop"
  resource_group_name      = "golive"
  location                 = "UK West"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "tfstates" {
  name                  = "tfstate.container"
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}
# Terraform backend configuration (must be in a separate file for initialization)
# NOTE: This block should go in a separate file like backend.tf *before* you run `terraform init`

terraform {
  backend "azurerm" {
    subscription_id      = "a9bc3c93-b459-4ffb-8364-38ff9554f652"
    resource_group_name  = "golive"
    storage_account_name = "storageroboshop"
    container_name       = "tfstate.container"
    key                  = "vault.terraform.tfstate"
  }
}