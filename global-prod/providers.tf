terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
   use_oidc = true
  }
}

provider "azurerm" {
  features {} # Required by AzureRM
  use_oidc = true
}