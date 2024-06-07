# ARGOCD VARIABLES 
    variable "ARGOCD" {
        description = "ArgoCD configuration"
        type        = object({
            server_addr = string
            username    = string
            password    = string
            namespace   = string
        })
    }