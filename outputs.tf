output "databricks_workspace_url" {
  value       = module.azure_infra.workspace_url
  description = "The URL of the Databricks Workspace"
}

output "storage_account_name" {
  value       = module.azure_infra.storage_account_name
  description = "The name of the Medallion architecture storage account"
}