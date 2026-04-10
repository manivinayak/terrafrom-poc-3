variable "rg_network" { type = string }
variable "rg_storage" { type = string }
variable "rg_databricks" { type = string }
variable "location"       { type = string }
variable "environment"    { type = string }
variable "vnet_cidr"      { type = string }
variable "public_subnet_cidr"  { type = string }
variable "private_subnet_cidr" { type = string }