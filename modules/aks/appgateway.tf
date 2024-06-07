# Description: This file contains the terraform configuration to deploy an Azure Application Gateway in the sandbox environment.
 
# Create the virtual network for app gateway
resource "azurerm_virtual_network" "appgateway" {
  name                = "appgateway"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  address_space       = var.APP_GATEWAY_VNET_ADDRESS_SPACE
}

resource "azurerm_subnet" "aks-app_gateway" {
  name                 = "aks-app_gateway"
  resource_group_name  = azurerm_resource_group.aks.name
  address_prefixes     = var.APP_GATEWAY_SUBNET_PREFIX
  virtual_network_name = azurerm_virtual_network.appgateway.name
}

resource "azurerm_application_gateway" "aks" {
  name                = "aks-appgateway"
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.aks-app_gateway.id
  }

  frontend_port {
    name = "frontendPort1"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontendIp1"
    public_ip_address_id = azurerm_public_ip.aks.id
  }

  backend_address_pool {
    name = "backendAddressPool1"
  }

  backend_http_settings {
    name                  = "backendHttpSettings1"
    cookie_based_affinity = "Disabled"
    port                  = 8600
    protocol              = "Http"
    request_timeout       = 1
  }

  http_listener {
    name                           = "listener1"
    frontend_ip_configuration_name = "frontendIp1"
    frontend_port_name             = "frontendPort1"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "rule1"
    rule_type                  = "Basic"
    http_listener_name         = "listener1"
    backend_address_pool_name  = "backendAddressPool1"
    backend_http_settings_name = "backendHttpSettings1"
    priority                   = 1
  }
}