resource "azurerm_storage_account" "unity" {
  name                     = "st${replace(var.prefix, "-", "")}unity"
  resource_group_name      = var.rg_storage
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
}

resource "azurerm_storage_data_lake_gen2_filesystem" "layers" {
  for_each           = toset(["bronze", "silver", "gold"])
  name               = each.key
  storage_account_id = azurerm_storage_account.unity.id
}

resource "azurerm_databricks_workspace" "this" {
  name                = "${var.prefix}-workspace"
  resource_group_name = var.rg_databricks
  location            = var.location
  sku                 = "premium"
 
  timeouts {
    create = "60m" # This is optional config done for testing because my Azure free account was taking lot time to get resource deployment we can remove this configuration.
    update = "60m"
  }
  custom_parameters {
    no_public_ip        = true
    virtual_network_id  = var.vnet_id
    public_subnet_name  = var.public_subnet
    private_subnet_name = var.private_subnet
    public_subnet_network_security_group_association_id  = var.public_subnet_nsg_association_id
    private_subnet_network_security_group_association_id = var.private_subnet_nsg_association_id
  }
}