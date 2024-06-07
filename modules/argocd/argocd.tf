 
 # Create the ArgoCD namespace
 resource "kubernetes_namespace" "argo_cd" {
   metadata {
     name = "argocd"
   }
   depends_on = [ azurerm_kubernetes_cluster.aks-sbx ]
 }


 # Create the ArgoCD service account
 resource "kubernetes_service_account" "argocd" {
   metadata {
     name      = "argocd"
     namespace = kubernetes_namespace.argo_cd.metadata[0].name
   }
 }


# Deploy ArgoCD
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.argo_cd.metadata[0].name
  version    = "6.9.2"
  create_namespace = true
  replace    = true
  }
