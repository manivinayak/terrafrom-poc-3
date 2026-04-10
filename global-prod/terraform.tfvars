environment         = "prod"
location            = "eastus"

rg_network          = "rg-kiewit-prod-network"
rg_storage          = "rg-kiewit-prod-storage"
rg_databricks       = "rg-kiewit-prod-databricks"

# Prod gets a completely different IP range so VNets don't overlap!
vnet_cidr           = "10.2.0.0/16"  
public_subnet_cidr  = "10.2.1.0/24"
private_subnet_cidr = "10.2.2.0/24"