resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-${var.environment}"

  default_node_pool {
    name                = "default"
    node_count          = 2
    vm_size             = "Standard_DS2_v2"
    min_count           = 1
    max_count           = 3
    enable_auto_scaling = true
    type                = "VirtualMachineScaleSets"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  role_based_access_control {
    enabled = true
    azure_active_directory {
      managed                = true
      admin_group_object_ids = var.aad_admin_group_object_ids
    }
  }

  addon_profile {
    kube_dashboard {
      enabled = false
    }
    azure_policy {
      enabled = true
    }
  }

  tags = {
    environment = var.environment
  }
}
