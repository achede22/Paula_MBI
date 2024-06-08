output "argocd_username" {
  description = "ArgoCD username"
  value       = var.ARGOCD["user"]
}

output "argocd_password" {
  description = "ArgoCD password"
  value       = var.ARGOCD["password"]
  sensitive   = true
}

output "argocd_namespace" {
  description = "ArgoCD namespace"
  value       = var.ARGOCD["namespace"]
}

output "argocd_server_addr" {
  description = "ArgoCD server address"
  value       = var.ARGOCD["server_addr"]
}