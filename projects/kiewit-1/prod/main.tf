data "azurerm_databricks_workspace" "this" {
  name                = "kiewit-${var.environment}-workspace"
  resource_group_name = var.rg_databricks
}

provider "databricks" {
  host = data.azurerm_databricks_workspace.this.workspace_url
}

resource "databricks_sql_endpoint" "serverless" {
  for_each = var.sql_warehouses
  name                      = "${var.environment}-${each.key}-sql"
  cluster_size              = each.value.cluster_size
  max_num_clusters          = each.value.max_num_clusters
  auto_stop_mins            = each.value.auto_stop_mins
  enable_serverless_compute = true
}

resource "databricks_cluster" "interactive" {
  for_each = var.databricks_clusters
  cluster_name            = "${var.environment}-${each.key}"
  spark_version           = each.value.spark_version
  node_type_id            = each.value.node_type_id
  autotermination_minutes = each.value.autotermination_minutes
  num_workers             = each.value.num_workers
  data_security_mode      = "USER_ISOLATION"
}