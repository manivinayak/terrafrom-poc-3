variable "prefix" {
  type        = string
  description = "Naming prefix"
}

variable "st_name" {
  type        = string
  description = "Storage account name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}

variable "is_prod" {
  type        = bool
  description = "Flag for production security hardening"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}

variable "custom_virtual_network_id" {
  type        = string
  description = "VNet ID"
}

variable "custom_public_subnet_name" {
  type        = string
  description = "Public subnet name"
}

variable "custom_private_subnet_name" {
  type        = string
  description = "Private subnet name"
}

variable "public_subnet_network_security_group_association_id" {
  type        = string
  description = "Public NSG ID"
}

variable "private_subnet_network_security_group_association_id" {
  type        = string
  description = "Private NSG ID"
}
