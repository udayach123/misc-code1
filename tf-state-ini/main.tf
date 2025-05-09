provider "azurerm" {
  features {}
  subscription_id = "a9bc3c93-b459-4ffb-8364-38ff9554f652"
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "golive"
  location = "UK West"
}

# Create a storage account
resource "azurerm_storage_account" "storage" {
  name                     = "storageroboshop"  # ✅ Removed the dot (invalid character)
  resource_group_name      = azurerm_resource_group.rg.name  # ✅ Use .name, not .id
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create a blob container
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate.container"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

# Terraform backend configuration (must be in a separate file for initialization)
# NOTE: This block should go in a separate file like backend.tf *before* you run `terraform init`

terraform {
  backend "azurerm" {
    subscription_id      = "a9bc3c93-b459-4ffb-8364-38ff9554f652"
    resource_group_name  = "golive"
    storage_account_name = "goliveroboshop"
    container_name       = "golivecontainer"
    key                  = "prod.terraform.tfstate"
  }
}