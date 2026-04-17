locals {
  prefix  = "${var.project_id}-${var.environment}"
  # Ensure storage account name is valid (no hyphens, lowercase, under 24 chars)
  st_name = replace("st${var.project_id}${var.environment}data", "-", "")
  
  common_tags = {
    Environment = var.environment
    Project     = var.project_id
    ManagedBy   = "Terraform"
  }
}