# provider "azurerm" {
#   features {}
# }
#
# resource "azurerm_resource_group" "golive" {
#   name     = "golive-resources"
#   location = "UK West"
# }
#
# resource "azurerm_storage_account" "golive" {
#   name                     = "golivestorage123" # must be globally unique & lowercase
#   resource_group_name      = azurerm_resource_group.golive.name
#   location                 = azurerm_resource_group.golive.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#
#   tags = {
#     environment = "demo"
#   }
# }
