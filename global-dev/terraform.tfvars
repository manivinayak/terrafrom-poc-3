environment         = "dev"
location            = "eastus"

rg_network          = "rg-kiewit-dev-network"
rg_storage          = "rg-kiewit-dev-storage"
rg_databricks       = "rg-kiewit-dev-databricks"

# Dev gets a smaller IP range
vnet_cidr           = "10.1.0.0/16"  
public_subnet_cidr  = "10.1.1.0/24"
private_subnet_cidr = "10.1.2.0/24"