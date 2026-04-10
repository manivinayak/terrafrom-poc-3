environment   = "prod"
project_id    = "kiewit-1"
rg_databricks = "rg-kiewit-prod-databricks" # Connects to the PROD workspace

sql_warehouses = {

  "kiewit-1-bi-reporting" = { cluster_size = "Medium", auto_stop_mins = 15, max_num_clusters = 3 } # Bigger for prod users!
  }

databricks_clusters = {} #Keep empty due limitation of Azure free account environment.