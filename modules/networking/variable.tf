variable "prefix" {
  type        = string
  description = "Naming prefix"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "vnet_cidr" {
  type        = string
  description = "VNet address space"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}
