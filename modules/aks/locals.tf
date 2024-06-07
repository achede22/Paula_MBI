locals {
    company_name              = "MBI"
    environment_lower         = lower(var.ENVIRONMENT)
    productive_flag_lower     = lower(var.PRODUCTIVE_FLAG)
    region                    = lower(var.PRODUCTIVE_FLAG) == "dr" ? "eu-ne" : "eu-we"
  
    aks_name                  = "${local.region}-sbx-${local.environment_lower}"
    vnet_aks_name             = "${local.region}-aks-${local.environment_lower}"

    replica_environment = "LAB"

    aks_resource_group_name     = "rg-${local.region}-aks-${local.environment_lower}"     # lower(var.PRODUCTIVE_FLAG) == "dr" ? azurerm_resource_group.aks[0].name : data.azurerm_resource_group.aks[0].name
    aks_resource_group_location = var.PRODUCTIVE_FLAG                                                         # lower(var.PRODUCTIVE_FLAG) == "dr" ? azurerm_resource_group.aks[0].location : data.azurerm_resource_group.aks[0].location
  }
