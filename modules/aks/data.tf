data "azurerm_resource_group" "aks" {
  # count = lower(var.PRODUCTIVE_FLAG) == "dr" ? 0 : 1
  name  = azurerm_resource_group.aks.name
}