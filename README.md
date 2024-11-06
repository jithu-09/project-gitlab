# Terraform Infrastructure Automation for AWS

This repository contains Terraform configurations to automate the creation of AWS infrastructure resources such as EC2 instances, VPC, Security Groups, and Subnets. It uses Terraform modules for a modular approach to infrastructure deployment. Additionally, a CI/CD pipeline is set up using GitLab CI/CD to automate the deployment process.

## Project Structure

The project structure is as follows:


### Key Files:

- **`backend.tf`**: Configures the Terraform backend to use S3 for state file storage and DynamoDB for state locking, ensuring only one user can modify the state at any given time.
- **`main.tf`**: The main Terraform file that calls the individual modules for VPC, Security Group, Subnet, and EC2 instances.
- **`provider.tf`**: Configures the AWS provider, including necessary credentials and region.
- **`variables.tf`**: Defines the input variables required by Terraform to deploy infrastructure.
- **`modules/`**: A directory containing reusable modules:
  - **`vpc/`**: Contains the configuration for VPC, Security Groups, and Subnets.
  - **`web/`**: Contains the configuration for EC2 instances.

## Modules Overview

- **`modules/vpc/`**: Contains the configuration for creating the VPC, Security Groups, and Subnets.
  - `main.tf`: Defines the VPC, subnet and security group.
  
- **`modules/web/`**: Contains the configuration for creating EC2 instances.
  - `main.tf`: Defines the EC2 instance configuration.

### Example Usage of Modules

In `main.tf`, the modules are invoked as follows:

```hcl
module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
  region = var.region
}

module "web" {
  source = "./modules/web"
  subnet_id = module.vpc.subnet_id
  instance_type = var.instance_type
}


### Key Updates:
1. **Modules**: Adjusted the `vpc` module to include Security Groups and Subnets as part of the module.
2. **Web Module**: Clarified that the `web` module is responsible for EC2 configuration.
3. **Module Usage**: The example usage of modules in `main.tf` is updated to reflect the new module structure.
4. **Branching and Merging Workflow**: Create a new branch, push changes(i.e, terraform files), and merge into the `main` branch in GitLab (best practice for production).
5. **GitLab CI/CD Pipeline**: Define the `.gitlab-ci.yml` pipeline configuration, including stages for `init`, `plan`, and `apply`, which ensures Terraform commands are executed automatically upon merging into the `main` branch. Added the file for your reference.
