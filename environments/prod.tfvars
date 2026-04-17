environment   = "dev"
project_id    = "kiewit-1"
location      = "eastus"
rg_databricks = "rg-kiewit-dev-databricks"
vnet_cidr     = "10.1.0.0/16"

# Empty to bypass free-tier limits, or add single-node config
databricks_clusters = {}
sql_warehouses      = {}