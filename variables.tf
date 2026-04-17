variable "environment" {
  type        = string
  description = "Deployment environment (dev, prod)"
}

variable "project_id" {
  type        = string
  description = "The project identifier (e.g., kiewit-1)"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
}

variable "rg_databricks" {
  type        = string
  description = "Resource group name for the Databricks workspace"
}

variable "vnet_cidr" {
  type        = string
  description = "CIDR block for the Virtual Network"
}

variable "databricks_clusters" {
  type        = any
  description = "Map of Databricks clusters to create"
  default     = {}
}

variable "sql_warehouses" {
  type        = any
  description = "Map of Databricks SQL Warehouses to create"
  default     = {}
}