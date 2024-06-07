# Description: This file is used to create AKS cluster and deploy resources on AKS cluster

# Resource Group
  resource "azurerm_resource_group" "aks" {
    #count    = lower(var.PRODUCTIVE_FLAG) == "dr" ? 1 : 0
    name     = local.aks_resource_group_name
    location = var.PRODUCTIVE_FLAG

    tags     = var.COMMON_TAGS

    lifecycle {
      ignore_changes = [        
          tags["CreatorOnDate"]
      ]
    } 
  }

# AGIC Identity
  resource "azurerm_user_assigned_identity" "agicAddonIdentity" {
    location            = azurerm_resource_group.aks.location
    name                = var.IDENTITY_NAME
    resource_group_name = azurerm_resource_group.aks.name
  }

# Assign Network Contributor role to AGIC Identity
  resource "azurerm_role_assignment" "aks" {
    scope                = azurerm_kubernetes_cluster.aks.id
    role_definition_name = "Network Contributor"
    principal_id         = azurerm_user_assigned_identity.agicAddonIdentity.principal_id
  }

# AKS Cluster
  resource "azurerm_kubernetes_cluster" "aks" {
    name                = "aks-${local.aks_name}"
    resource_group_name = local.aks_resource_group_name
    location            = local.aks_resource_group_location
    dns_prefix          = "aks-mbi-${local.environment_lower}"
    kubernetes_version  = var.AKS_VERSION
    sku_tier            = var.AKS_SKU_TIER

    # AKS Cluster Configuration
      network_profile {
        network_plugin    = var.NETWORK_PLUGIN
        service_cidr      = var.SERVICE_CIDR
        dns_service_ip    = var.DNS_SERVICE_IP
      }

      default_node_pool {
        name              = var.NODE_POOL_NAME
        node_count        = var.NODE_COUNT
        vm_size           = var.VM_SIZE
          tags            = var.COMMON_TAGS
          vnet_subnet_id  = azurerm_subnet.aks.id
      }

      identity {
        type              = "SystemAssigned"
      }
    }

## call YAML k8s deployments
#  data "local_file" "deployments" {
#    filename            = "${path.module}/manifest/test-pod.yaml"
#  }
#
#  data "local_file" "mario" {
#    filename            = "${path.module}/manifest/mario-deployment.yaml"
#  }
#
#  # Mario
#  data "local_file" "cosmosdb_account" {
#    filename            = "${path.module}/manifest/cosmosdb.account.yaml"
#  }

