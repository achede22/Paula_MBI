# AKS cluster
    LOCATION            = "eu-we"
    PRODUCTIVE_FLAG     = "westeurope"
    ENVIRONMENT         = "sandbox"
    IDENTITY_NAME       = "agicAddonIdentity"
    DNS_PREFIX          = "sandbox-aks"
    AKS_VERSION         = "1.19.11"
    AKS_SKU_TIER        = "Free"

# network profile
    NETWORK_PLUGIN = "kubenet"
    SERVICE_CIDR   = "172.16.4.0/16"
    DNS_SERVICE_IP = "172.16.4.10"

# default_node_pool
    NODE_POOL_NAME = "default"
    NODE_COUNT     = 1
    VM_SIZE        = "Standard_D2_v2"

# AKS networking
    VNET_ADDRESS_SPACE              = ["172.16.4.0/16"]
    SUBNET_PREFIX                   = ["172.16.4.0/24"]
    
# App Gateway networking
    APP_GATEWAY_VNET_ADDRESS_SPACE  = ["172.16.0.0/16"] #CIDR notation
    APP_GATEWAY_SUBNET_PREFIX       = ["172.16.3.0/24"]


# Peerings: remote_virtual_network_id 
#    VNET_HUB_ID         ="/subscriptions/b0cc4cbd-8a30-443c-b8fd-12e629e318fe/resourceGroups/rg-eu-we-hub-sbx/providers/Microsoft.Network/virtualNetworks/vnet-eu-we-hub-sbx"
#    VNET_APPGATEWAY_ID  ="/subscriptions/ced02317-875f-4553-a004-78707492f256/resourceGroups/rg-eu-we-appgateway-nopro/providers/Microsoft.Network/virtualNetworks/vnet-eu-we-appgateway-nopro"