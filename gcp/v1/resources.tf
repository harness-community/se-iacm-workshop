// Define the resources to create
// Provisions the following into GCP:
//    VCP, Subnet, GCE Instance, Storage Bucket

// VPC
resource "google_compute_network" "vpc" {
  name                    = "main"
  auto_create_subnetworks = false
}

// Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "main"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.vpc.id
}

// GCE Instance
resource "google_compute_instance" "gce-vm" {
  name         = "gce-vm-${count.index}"
  machine_type = var.instance_type
  count        = 3

  boot_disk {
    initialize_params {
      image                 = "debian-cloud/debian-11"
      resource_manager_tags = {}
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.self_link
  }

  allow_stopping_for_update = true
  labels                    = {}
  metadata                  = {}
  resource_policies         = []
  tags                      = []

}
