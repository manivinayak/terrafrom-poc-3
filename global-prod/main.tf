data "azurerm_client_config" "current" {}

# 1. CREATE THE 3 RESOURCE GROUPS
resource "azurerm_resource_group" "network" {
  name     = var.rg_network
  location = var.location
}

resource "azurerm_resource_group" "storage" {
  name     = var.rg_storage
  location = var.location
}

resource "azurerm_resource_group" "databricks" {
  name     = var.rg_databricks
  location = var.location
}

# 2. CREATE NETWORKING (Goes to Network RG)
module "network" {
  source              = "../modules/networking"
  prefix              = "kiewit-${var.environment}"
  rg_name             = azurerm_resource_group.network.name
  location            = azurerm_resource_group.network.location
  vnet_cidr           = var.vnet_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

# 3. CREATE KEY VAULT (Goes to Storage RG)
resource "azurerm_key_vault" "this" {
  name                = "kv-kiewit-${var.environment}-001"
  location            = azurerm_resource_group.storage.location
  resource_group_name = azurerm_resource_group.storage.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  purge_protection_enabled = false 
}

# 4. CREATE BASE INFRASTRUCTURE (Storage & Databricks)
module "base_infra" {
  source         = "../modules/azure_infra"
  prefix         = "kiewit-${var.environment}"
  location       = var.location
  
  # Pass the specific target Resource Groups to the module
  rg_storage     = azurerm_resource_group.storage.name
  rg_databricks  = azurerm_resource_group.databricks.name
  
  vnet_id        = module.network.vnet_id
  public_subnet  = module.network.public_subnet_name
  private_subnet = module.network.private_subnet_name
  public_subnet_nsg_association_id  = module.network.public_subnet_nsg_association_id
  private_subnet_nsg_association_id = module.network.private_subnet_nsg_association_id
}