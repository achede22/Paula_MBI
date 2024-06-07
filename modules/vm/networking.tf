### Create the virtual network (vnet)
resource "azurerm_virtual_network" "vm-sbx" {
  name                = "vnet-vm-eu-we-sbx-vm"
  location            = azurerm_resource_group.vm-sbx.location
  resource_group_name = azurerm_resource_group.vm-sbx.name
  address_space       = ["172.16.3.0/16"]
  tags = var.COMMON_TAGS
}

##### Create the subnet
resource "azurerm_network_security_group" "vm-sbx" {
  name                = "nsg-vm-eu-we-lab-sbx"
  location            = azurerm_resource_group.vm-sbx.location
  resource_group_name = azurerm_resource_group.vm-sbx.name
  tags = var.COMMON_TAGS
  // ... vm-specific rules ...
  security_rule {
    name                       = "vm-rule"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1433"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate the NSG with the vm subnet
resource "azurerm_subnet_network_security_group_association" "vm_nsg_association" {
  subnet_id                 = azurerm_subnet.vm-sbx.id
  network_security_group_id = azurerm_network_security_group.vm-sbx.id
}

# Subnet
resource "azurerm_subnet" "vm-sbx" {
  name                 = "snet-vm-eu-we-lab-sbx"
  resource_group_name  = azurerm_resource_group.vm-sbx.name
  virtual_network_name = azurerm_virtual_network.vm-sbx.name
  address_prefixes     = ["172.16.1.0/24"]
}

# Network Interface
resource "azurerm_network_interface" "vm-sbx" {
  name                = "nic-vm-eu-we-lab-sbx"
  location            = azurerm_resource_group.vm-sbx.location
  resource_group_name = azurerm_resource_group.vm-sbx.name
  tags = var.COMMON_TAGS

  # IP Configuration
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm-sbx.id
    private_ip_address_allocation = "Dynamic"
  }
}
