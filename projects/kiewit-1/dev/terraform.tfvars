environment   = "dev"
project_id    = "kiewit-1"
rg_databricks = "rg-kiewit-dev-databricks" # Connects to the DEV workspace

sql_warehouses = {
  "kiewit-1-bi-reporting"    = { cluster_size = "Small", auto_stop_mins = 10, max_num_clusters = 2 }
  "kiewit-1-data-science"    = { cluster_size = "Large", auto_stop_mins = 15, max_num_clusters = 1 }
   
}
databricks_clusters = {} #Keep empty due limitation of Azure free environment.
