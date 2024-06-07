resource "azurerm_virtual_network" "aks" {
  name                = "vnet-${local.vnet_aks_name}"
  address_space       = var.VNET_ADDRESS_SPACE
  resource_group_name = local.aks_resource_group_name
  location            = local.aks_resource_group_location

  tags = var.COMMON_TAGS

  lifecycle {
    ignore_changes = [        
        tags["CreatorOnDate"]
    ]
  } 
}

resource "azurerm_subnet" "aks" {
  name                 = "snet-${local.vnet_aks_name}"
  resource_group_name  = local.aks_resource_group_name
  virtual_network_name = azurerm_virtual_network.aks.name
  address_prefixes     = var.VNET_ADDRESS_SPACE

  service_endpoints = ["Microsoft.AzureCosmosDB", "Microsoft.Storage"]
}

# resource "azurerm_virtual_network_peering" "aks_hub" {
#   name                      = "peer-vnet-${local.region}-hub-glb"
#   resource_group_name       = local.aks_resource_group_name
#   virtual_network_name      = azurerm_virtual_network.aks.name
#   remote_virtual_network_id = var.VNET_HUB_ID
#   use_remote_gateways       = true
# }

# resource "azurerm_virtual_network_peering" "aks_appgateway" {
#   name                      = "peer-vnet-${local.region}-appgateway-${local.productive_flag_lower}"
#   resource_group_name       = local.aks_resource_group_name
#   virtual_network_name      = azurerm_virtual_network.appgateway.name
#   remote_virtual_network_id = var.VNET_APPGATEWAY_ID
#   use_remote_gateways       = true
# }

resource "azurerm_public_ip" "aks" {
  name                = "pip-${local.vnet_aks_name}"
  resource_group_name = local.aks_resource_group_name
  location            = local.aks_resource_group_location
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.COMMON_TAGS
}