//Define the provider and any data sources
provider "google" {
  project = var.gcp_project_id
  region  = "us-east1"
  zone    = "us-east1-b"
}
