resource "azurerm_public_ip" "publicip" {
  name                = var.name
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_network_interface" "privateip" {
  name                = var.name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = "/subscriptions/a9bc3c93-b459-4ffb-8364-38ff9554f652/resourceGroups/golive/providers/Microsoft.Network/virtualNetworks/golive-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg-attach" {
  network_interface_id      = azurerm_network_interface.privateip.id
  network_security_group_id = "/subscriptions/a9bc3c93-b459-4ffb-8364-38ff9554f652/resourceGroups/golive/providers/Microsoft.Network/networkSecurityGroups/allow-all"
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.name
  location                        = var.rg_location
  resource_group_name             = var.rg_name
  size                            = var.vm_size
  network_interface_ids           = [azurerm_network_interface.privateip.id]
  # priority                        = "Spot"
  # eviction_policy                 = "Deallocate"
  # max_bid_price                   = -1
  admin_username                  = "devops18"
  admin_password                  = "Passw0rd@1234"
  disable_password_authentication = false

  os_disk {
    name                 = "${var.name}-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_id = "/subscriptions/a9bc3c93-b459-4ffb-8364-38ff9554f652/resourceGroups/golive/providers/Microsoft.Compute/images/vault-image"

}

resource "azurerm_dns_a_record" "public_dns_record" {
  depends_on          = [azurerm_linux_virtual_machine.vm]
  name                = var.name
  zone_name           = "yourtherapist.in"
  resource_group_name = var.rg_name
  ttl                 = 300
  records             = [azurerm_public_ip.publicip.ip_address]
}

resource "azurerm_dns_a_record" "private_dns_record" {
  name                = "${var.name}-vault"
  zone_name           = "yourtherapist.in"
  resource_group_name = var.rg_name
  ttl                 = 300
  records             = [azurerm_network_interface.privateip.private_ip_address]
}
