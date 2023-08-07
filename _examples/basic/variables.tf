# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Region Code"
}

variable "cluster_endpoint_public_access" {
  type    = bool
  default = true
}

variable "cluster_endpoint_private_access" {
  type    = bool
  default = true
}

variable "iam_role_use_name_prefix" {
  type    = string
  default = "terraform-helm-eks-addons"
}

variable "token" {
  type    = string
  default = "test-addon-efs"
}

variable "istio_manifests" {
  type = object({
    istio_ingress_manifest_file_path = string
    istio_gateway_manifest_file_path = string
  })
  default = {
    istio_ingress_manifest_file_path = "./config/istio/ingress.yaml"
    istio_gateway_manifest_file_path = "./config/istio/gateway.yaml"
  }
}

variable "kiali_manifests" {
  type = object({
    kiali_virtualservice_file_path = string
    enable_monitoring              = bool
  })
  default = {
    kiali_virtualservice_file_path = "./config/kiali/kiali_vs.yaml"
    enable_monitoring              = true
  }
}

#--------------EXTERNAL SECRET---------------
variable "externalsecrets_manifest" {
  type = object({
    secret_store_manifest_file_path     = string
    external_secrets_manifest_file_path = string
    secret_manager_name                 = string
  })
  default = {
    secret_store_manifest_file_path     = "./config/external-secret/secret-store.yaml"
    external_secrets_manifest_file_path = "./config/external-secret/external-secret.yaml"
    secret_manager_name                 = "addon-external_secrets"
  }
}