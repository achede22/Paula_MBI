# Description: This file contains the terraform code to deploy a virtual machine in Azure.

### Creste resource group
resource "azurerm_resource_group" "vm-sbx" {
  name     = "rg-vm-eu-we-lab.sbx"
  location = "West Europe"
  tags = var.COMMON_TAGS
}

# Create linux virtual machine
resource "azurerm_linux_virtual_machine" "vm-sbx" {
  name                = "vm-eu-we-lab-sbx"
  resource_group_name = azurerm_resource_group.vm-sbx.name
  location            = azurerm_resource_group.vm-sbx.location
  size                = "Standard_DS1_v2"
  admin_username      = "adminuser"
  tags = var.COMMON_TAGS
  network_interface_ids = [
    azurerm_network_interface.vm-sbx.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("${path.module}/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Ubuntu Server 22.04 LTS
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}