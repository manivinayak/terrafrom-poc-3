variable "project_id" {
  description = "The name of the project"
  type        = string
  default     = "kiewit-1"
}
variable "rg_databricks" {
  type        = string
  description = "The name of the resource group containing the Databricks workspace"
}

variable "environment" {
  type        = string
  description = "The environment prefix (e.g., dev, qa, prod)"
}

variable "sql_warehouses" {
  description = "A map of configurations for Databricks Serverless SQL Warehouses"
  type = map(object({
    cluster_size     = string
    auto_stop_mins   = number
    max_num_clusters = number
  }))
  default = {}
}

variable "databricks_clusters" {
  description = "Configurations for All-Purpose Interactive Clusters"
  type = map(object({
    spark_version           = string
    node_type_id            = string
    num_workers             = number
    autotermination_minutes = number
  }))
  default = {}
}