# This provider is used to configure your Google Cloud Platform infrastructure
provider "google" {
  project = var.project_id
  region  = var.region
}

# Add VPC here
module "my_vpc" {
  source     = "./modules/vpc"
  project_id = data.google_project.project.project_id
  vpc_name   = var.name
}

# This data source allows Terraform configuration to use the GCP project defined outside of Terraform
data "google_project" "project" {
  project_id = var.project_id
}

