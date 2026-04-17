resource "azurerm_databricks_workspace" "this" {
  name                        = "${var.prefix}-workspace"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku                         = "premium"
  tags                        = var.tags

  custom_parameters {
    no_public_ip                                         = true
    virtual_network_id                                   = var.custom_virtual_network_id
    public_subnet_name                                   = var.custom_public_subnet_name
    private_subnet_name                                  = var.custom_private_subnet_name
    public_subnet_network_security_group_association_id  = var.public_subnet_network_security_group_association_id
    private_subnet_network_security_group_association_id = var.private_subnet_network_security_group_association_id
  }

  timeouts {
    create = "60m"
    update = "60m"
  }

  lifecycle { prevent_destroy = true }
}

resource "azurerm_storage_account" "unity" {
  name                              = var.st_name
  resource_group_name               = var.resource_group_name
  location                          = var.location
  account_tier                      = "Standard"
  account_replication_type          = var.is_prod ? "GRS" : "LRS"

  # Enterprise Security Hardening
  min_tls_version                   = "TLS1_2"
  https_traffic_only_enabled        = true
  allow_nested_items_to_be_public   = false
  shared_access_key_enabled         = false 

  tags = var.tags
  lifecycle { prevent_destroy = true }
}

resource "azurerm_key_vault" "this" {
  name                      = "${var.prefix}-kv"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  tenant_id                 = var.tenant_id
  sku_name                  = "standard"
  
  enable_rbac_authorization = true
  purge_protection_enabled  = var.is_prod ? true : false
  tags                      = var.tags
}