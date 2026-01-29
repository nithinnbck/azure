resource "azurerm_virtual_network" "aks_vnet" {
  name                = "${var.resource_group_name}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  address_space       = [var.vnet_address_space]
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "${var.resource_group_name}-subnet"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = [var.subnet_address_prefix]

  delegation {
    name = "aks_delegation"
    service_delegation {
      name = "Microsoft.ContainerService/managedClusters"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action"
      ]
    }
  }
}
