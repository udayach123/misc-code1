provider "azurerm" {
  features {}
  subscription_id = "a9bc3c93-b459-4ffb-8364-38ff9554f652"
}


# provider "vault" {
#   address = "http://vaultnew.yourtherapist.in:8200"
#   token   =  var.token
# }

terraform {
  backend "azurerm" {
    subscription_id      = "a9bc3c93-b459-4ffb-8364-38ff9554f652"
    resource_group_name  = "golive"
    storage_account_name = "storageroboshop"
    container_name       = "tfstate-container"
    key                  = "tools.terraform-tfstate"
  }
}

