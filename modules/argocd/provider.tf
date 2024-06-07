provider "argocd" {
  server_addr = var.ARGOCD["server_addr"]
  username    = var.ARGOCD["username"]
  password    = var.ARGOCD["password"]
  namespace   = var.ARGOCD["argocd"]
}