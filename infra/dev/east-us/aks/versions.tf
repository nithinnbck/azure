terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.80.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatestorageaksnithin"
    container_name       = "tfstate"
    key                  = "aks-cluster.terraform.tfstate"
    use_azure_cli_auth   = true
  }
}
