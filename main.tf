data "azurerm_client_config" "current" {}

locals {
  # Use a stable Spark LTS version (update as needed)
  spark_version = "12.2.x-scala2.12"
}

module "networking" {
  source              = "./modules/networking"
  prefix              = local.prefix
  location            = var.location
  resource_group_name = var.rg_databricks
  vnet_cidr           = var.vnet_cidr
  tags                = local.common_tags
}

module "azure_infra" {
  source                                               = "./modules/azure_infra"
  prefix                                               = local.prefix
  st_name                                              = local.st_name
  location                                             = var.location
  resource_group_name                                  = var.rg_databricks
  tenant_id                                            = data.azurerm_client_config.current.tenant_id
  custom_virtual_network_id                            = module.networking.vnet_id
  custom_public_subnet_name                            = module.networking.public_subnet_name
  custom_private_subnet_name                           = module.networking.private_subnet_name
  public_subnet_network_security_group_association_id  = module.networking.public_nsg_association_id
  private_subnet_network_security_group_association_id = module.networking.private_nsg_association_id
  is_prod                                              = var.environment == "prod"
  tags                                                 = local.common_tags
}

resource "databricks_cluster" "interactive" {
  for_each                = var.databricks_clusters
  cluster_name            = "${local.prefix}-${each.key}"
  spark_version           = local.spark_version
  node_type_id            = each.value.node_type_id
  autotermination_minutes = each.value.autotermination_minutes
  num_workers             = each.value.num_workers
  data_security_mode      = try(each.value.security_mode, "USER_ISOLATION")

  depends_on = [module.azure_infra]
}

resource "databricks_sql_endpoint" "serverless" {
  for_each         = var.sql_warehouses
  name             = "${local.prefix}-${each.key}-sql"
  cluster_size     = each.value.cluster_size
  max_num_clusters = each.value.max_num_clusters
  auto_stop_mins   = each.value.auto_stop_mins

  depends_on = [module.azure_infra]
}
