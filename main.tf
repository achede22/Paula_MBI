

module "aks" {
  source              = "./modules/aks"
  COMMON_TAGS         = var.COMMON_TAGS
  PRODUCTIVE_FLAG     = var.PRODUCTIVE_FLAG
  AKS_SKU_TIER        = var.AKS_SKU_TIER
  NETWORK_PLUGIN      = var.NETWORK_PLUGIN
  NODE_COUNT          = var.NODE_COUNT
  VNET_ADDRESS_SPACE  = var.VNET_ADDRESS_SPACE
  NODE_POOL_NAME      = var.NODE_POOL_NAME
  AKS_VERSION         = var.AKS_VERSION
  IDENTITY_NAME       = var.IDENTITY_NAME
  LOCATION            = var.LOCATION
  SUBNET_PREFIX       = var.SUBNET_PREFIX
  SERVICE_CIDR        = var.SERVICE_CIDR
  DNS_PREFIX          = var.DNS_PREFIX
  ENVIRONMENT         = var.ENVIRONMENT
  DNS_SERVICE_IP      = var.DNS_SERVICE_IP
  VM_SIZE             = var.VM_SIZE
  APP_GATEWAY_SUBNET_PREFIX      = var.APP_GATEWAY_SUBNET_PREFIX
  APP_GATEWAY_VNET_ADDRESS_SPACE = var.APP_GATEWAY_VNET_ADDRESS_SPACE
  # VNET_APPGATEWAY_ID  = var.VNET_APPGATEWAY_ID
  // Pass any other required variables here
}


module cosmodb {
  source              = "./modules/cosmosdb"
  COMMON_TAGS         = var.COMMON_TAGS
  // Pass any required variables here
}

module vm {
  source              = "./modules/vm"
  COMMON_TAGS         = var.COMMON_TAGS
  // Pass any required variables here
}

# module vm {
#   source = "./modules/peerings"
#   ENVIRONMENT = var.ENVIRONMENT
#   PRODUCTIVE_FLAG = var.PRODUCTIVE_FLAG
# }