variable "resource_group_name" {
  description = "Resource Group for AKS"
  type        = string
  default     = "rg-aks-prod"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "aks_cluster_name" {
  description = "AKS cluster name"
  type        = string
  default     = "aks-prod"
}

variable "node_count" {
  description = "Default node count"
  type        = number
  default     = 3
}

variable "node_vm_size" {
  description = "VM size for nodes"
  type        = string
  default     = "Standard_D4s_v3"
}

variable "kubernetes_version" {
  description = "AKS Kubernetes version"
  type        = string
  default     = "1.28.0"
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_address_prefix" {
  description = "Subnet for AKS"
  type        = string
  default     = "10.0.1.0/24"
}
