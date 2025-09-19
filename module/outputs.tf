output "vpc_id" {
  value = google_compute_network.vpc_network.id
}

output "subnet_ids" {
  value = { for k, v in google_compute_subnetwork.subnets : k => v.id }
}
