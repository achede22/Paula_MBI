resource "azurerm_resource_group" "cosmosdb-sbx" {
  name     = "rg-db-eu-we-lab-sbx"
  location = "West Europe"
  tags = var.COMMON_TAGS
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_cosmosdb_account" "db" {
  name                = "cosmosdb-sbx-${random_integer.ri.result}"
  location            = azurerm_resource_group.cosmosdb-sbx.location
  resource_group_name = azurerm_resource_group.cosmosdb-sbx.name
  offer_type          = "Standard"
  kind                = "MongoDB"
  tags = var.COMMON_TAGS

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }

  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = "westeurope"
    failover_priority = 0
  }

 # geo_location {
 #   location          = "East US"
 #   failover_priority = 1
 # }
 
}