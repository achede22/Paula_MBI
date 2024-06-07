provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

data "helm_repository" "argo" {
  name = var.ARGOCD["repo_name"]
  url  = var.ARGOCD["repo_url"]
}

resource "helm_release" "argocd" {
  name       = var.ARGOCD["name"]
  namespace  = var.ARGOCD["namespace"]
  repository = data.helm_repository.argo.metadata[0].name
  chart      = var.ARGOCD["chart"]
  version    = var.ARGOCD["version"]

  set {
    name  = "server.admin.password"
    value = var.ARGOCD["password"]
  }

  set {
    name  = "server.admin.user"
    value = var.ARGOCD["user"]
  }

  # Wait for the AKS cluster to be ready before installing ArgoCD
  depends_on = [ module.aks.azurerm_kubernetes_cluster.aks-sbx ]

}