# Cloud Web App Builder

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

A robust Infrastructure as Code (IaC) solution that automates the provisioning of an AWS lab environment previously set up manually via the AWS Management Console. Using Terraform, the project replicates and enhances the deployment of a scalable web application infrastructure. It implements a complete web application stack with high availability, auto-scaling, and secure networking configurations. This transition to Terraform enables efficient, reproducible, and version-controlled infrastructure provisioning.
## 🏗️ Architecture Overview

The infrastructure consists of the following AWS components:

- **VPC & Networking**
  - Custom VPC with public and private subnets
  - Internet Gateway for public access
  - NAT Gateway for private subnet connectivity
  - Route tables for traffic management

- **Compute & Scaling**
  - EC2 instances for web application hosting
  - Auto Scaling Group for dynamic scaling
  - Application Load Balancer for traffic distribution
  - Launch template for consistent instance configuration

- **Database**
  - RDS MySQL instance in private subnet
  - Automated database initialization
  - Secure connection configuration

- **Development Environment**
  - Cloud9 IDE integration
  - Pre-configured development workspace

- **Security**
  - Dedicated security groups for each component
  - Instance profiles


## 📦 Module Structure
```
cloud-web-app-builder/
├── main.tf                 # Main configuration file
├── variables.tf         # Variable declarations
├── providers.tf             # Output declarations
├── modules/
│   ├── vpc/            # VPC configuration
│   ├── security_groups/  # Security group configurations
│   ├── ec2/             # EC2 instance configurations
│   ├── rds/             # RDS database setup
│   ├── cloud9/       # Cloud9 environment
│   ├── alb/          # Load balancer configuration
│   └── auto-scaling/    # Auto scaling configuration
└── scripts/            # User data scripts
```
## 🚀 Quick Start

### Prerequisites

- AWS Account with appropriate permissions
- [Terraform](https://www.terraform.io/downloads.html) (v5.0)
- [AWS CLI](https://aws.amazon.com/cli/) configured with your credentials
- Basic understanding of AWS services and Terraform

### Installation

1. Clone the repository:
```bash
git clone https://github.com/ghaithsaidani/cloud-web-app-builder.git
cd cloud-web-app-builder
```

2. Apply the infrastructure:
```bash
terraform init
```
```bash
terraform plan
```
```bash
terraform apply
```

---

## 🙌 Acknowledgment

This project was developed by me [Ghaith Saidani](https://github.com/ghaithsaidani).

Let me know if you need anything else!