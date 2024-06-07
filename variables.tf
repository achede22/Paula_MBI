variable "ENVIRONMENT" {
    description = "The Environment we are deploying."
}


variable "PRODUCTIVE_FLAG" {
    description = "The flag which indicates if the resources are from a productive environment or not. Tha values may be prod or noprod."
}

variable "COMMON_TAGS" {
    description = "The common tags to be applied to all resources."
    type        = map(string)
  default = {
    Environment   = "LAB"
    Creator       = "Hernán De León"
    SolutionName  = "shared"
    Temporary     = "false"
    Scope         = "networking"
  }
}


variable "LOCATION" {
    description = "The Azure location where resources will be created"
    type        = string
}


variable "IDENTITY_NAME" {
    description = "The name of the user assigned identity"
    type        = string
}


variable "AKS_VERSION" {
    description = "The version of the AKS cluster"
    type        = string
}

variable "AKS_SKU_TIER" {
    description = "The SKU tier of the AKS cluster"
    type        = string
}

variable "DNS_PREFIX" {
    description = "The DNS prefix for the AKS cluster"
    type        = string
}


# AKS node pool
variable "NETWORK_PLUGIN" {
    description = "The network plugin to use for the AKS cluster"
    type        = string
}


variable "SERVICE_CIDR" {
    description = "The service CIDR to use for the AKS cluster"
    type        = string
}


variable "DNS_SERVICE_IP" {
    description = "The DNS service IP to use for the AKS cluster"
    type        = string
}


variable "NODE_POOL_NAME" {
    description = "The name of the default node pool"
    type        = string
}


variable "NODE_COUNT" {
    description = "The number of nodes in the default node pool"
    type        = number
}


variable "VM_SIZE" {
    description = "The VM size to use for the nodes in the default node pool"
    type        = string
}


# AKS Networking
variable "VNET_ADDRESS_SPACE" {
    description = "The address space for the virtual network"
    type        = list(string)
}


variable "SUBNET_PREFIX" {
    description = "The subnet prefix for the AKS subnet"
    type        = list(string)
}


# App Gateway Networking
    variable "APP_GATEWAY_VNET_ADDRESS_SPACE" {
        description = "The address space for the app gateway virtual network"
        type        = list(string)
    }

    
    variable "APP_GATEWAY_SUBNET_PREFIX" {
        description = "The address prefix for the app gateway subnet"
        type        = list(string)
    }


# # aks_appgateway peering
#     variable "VNET_HUB_ID" {
#         description = "The ID of the virtual network to peer with the AKS virtual network"
#         type        = string
#     }
# 
# # appgateway peering
#     variable "VNET_APPGATEWAY_ID" {
#         description = "The ID of the virtual network to peer with the AKS virtual network"
#         type        = string
#         }

