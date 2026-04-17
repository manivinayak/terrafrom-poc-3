terraform {
  required_version = "~> 1.14"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.68"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.112"
    }
  }

  backend "azurerm" {
    use_oidc         = true
    use_azuread_auth = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

provider "databricks" {
  host                        = module.azure_infra.workspace_url
  azure_workspace_resource_id = module.azure_infra.workspace_id
  azure_use_msi               = true
}