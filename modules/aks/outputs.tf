output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

data "azurerm_subscription" "current" {}

output "TF_OUTPUT_AKS_ENV_RESOURCE_GROUP_NAME" {
  value = local.aks_resource_group_name
}

# output "TF_OUTPUT_NETWORKING_RESOURCE_GROUP_NAME" {
#   value = data.azurerm_resource_group.networking.name
# }

output "TF_OUTPUT_AKS_CLUSTER_NAME" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "TF_OUTPUT_AZURE_SUBSCRIPTION_ID" {
  value = data.azurerm_subscription.current.subscription_id
}

output "TF_OUTPUT_AZURE_SUBSCRIPTION_DISPLAY_NAME" {
  value = data.azurerm_subscription.current.display_name
}


output "TF_OUTPUT_AGIC_IDENTITY_RESOURCE" {
  value = azurerm_user_assigned_identity.agicAddonIdentity.id
}

output "TF_OUTPUT_AGIC_IDENTITY_CLIENT_ID" {
  value = azurerm_user_assigned_identity.agicAddonIdentity.principal_id
}