//Output After Run
output "vpc_self_link" {
  description = "VPC network self link"
  value       = google_compute_network.vpc.self_link
  sensitive   = true
}

output "vpc_id" {
  description = "VPC network ID"
  value       = google_compute_network.vpc.id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = google_compute_subnetwork.subnet.id
}

output "ips" {
  description = "Map of VM names to their private IP addresses"
  value = {
    for instance in google_compute_instance.gce-vm :
    instance.name => instance.network_interface[0].network_ip
  }
}
