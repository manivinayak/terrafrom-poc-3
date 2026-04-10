***

# Enterprise Azure Databricks CI/CD Pipeline

> **Note:** This repository represents the initial Proof of Concept (POC) Architected and      engineered by **Anshu Tewari**. 

## Project Overview

This project demonstrates a fully automated, production-ready CI/CD pipeline for deploying Azure Databricks infrastructure. Built using **Terraform** and orchestrated via **GitHub Actions**, it follows a strict Trunk-Based Development (TBD) methodology. 

The architecture is designed with enterprise security and scalability in mind, utilizing passwordless authentication (OIDC) and enforcing a strict separation between foundational cloud infrastructure and data engineering resources.

## Key Architectural Features

* **Strict Separation of Concerns:** The codebase is split into **Global** (Azure Resource Groups, Virtual Networks, Databricks Workspaces) and **Project** (Databricks Clusters, SQL Warehouses, Notebooks). This prevents daily engineering updates from accidentally impacting core networking.
* **Automated Environment Promotion:** Code merged into the 'main' branch automatically triggers a sequential deployment pipeline, safely validating infrastructure in 'Dev' before seamlessly promoting it to 'Prod'.
* **Zero-Trust Security:** Utilizes Azure OpenID Connect (OIDC) for GitHub Actions authentication, completely eliminating the need for static client secrets.
* **Least Privilege Design:** Engineered to operate within restricted Azure Custom Roles, supporting pre-created Resource Groups, Private Link networking.

📁 repo-root/
│
├── 📁 .github/
│   └── 📁 workflows/
│       └── 📄 tbd-pipeline.yml       
│
├── 📁 global-dev/                    
│   ├── 📄 main.tf                    
│   ├── 📄 providers.tf               
│   ├── 📄 variables.tf               
│   └── 📄 terraform.tfvars           
│
├── 📁 global-prod/                   
│   ├── 📄 main.tf
│   ├── 📄 providers.tf
│   ├── 📄 variables.tf
│   └── 📄 terraform.tfvars            
│
└── 📁 projects/
    └── 📁 kiewit-1/
        ├── 📁 dev/                    
        │   ├── 📄 main.tf             
        │   ├── 📄 providers.tf        
        │   ├── 📄 variables.tf
        │   └── 📄 terraform.tfvars    
        │
        └── 📁 prod/                   
            ├── 📄 main.tf
            ├── 📄 providers.tf        
            ├── 📄 variables.tf
            └── 📄 terraform.tfvars    