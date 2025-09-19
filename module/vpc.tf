resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
}

resource "google_compute_subnetwork" "subnets" {
  for_each        = { for subnet in var.subnets : subnet.name => subnet }
  name            = "${each.value.name}-subnetwork"
  ip_cidr_range   = each.value.cidr_range
  region          = each.value.subnet_region
  network         = google_compute_network.vpc_network.id

  secondary_ip_range {
    range_name    = "${each.value.name}-secondary-range"
    ip_cidr_range = each.value.secondary_range
  }
}

resource "google_compute_firewall" "firewalls" {
  for_each = {
    for subnet in var.subnets : subnet.name => subnet
    if subnet.create_fw_rule
  }

  name    = "${var.vpc_name}-${each.value.name}-firewall-fw"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_tags = each.value.source_tags
}


# resource "google_compute_network" "vpc_network" {
#   project                 = var.project_id
#   name                    = var.vpc_name
#   auto_create_subnetworks = var.auto_create_subnetworks
# }

# resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
#   name          = "${var.subnet_name}-subnetwork"
#   ip_cidr_range = var.cidr_range #"10.2.0.0/16"
#   region        = var.subnet_region
#   network       = google_compute_network.vpc_network.id
#   secondary_ip_range {
#     range_name    = "${var.subnet_name}-secondary-range"
#     ip_cidr_range = var.secondary_ip_range #"192.168.10.0/24"
#   }
# }
# resource "google_compute_firewall" "firewall" {
#   count = var.create_fw_rule ? 1 : 0
#   name    = "${var.vpc_name}-${var.subnet_name}-firewall-fw"
#   network = google_compute_network.vpc_network.id

#   allow {
#     protocol = "tcp"
#     ports    = ["22", "80", "443"]
#   }
#   source_tags = var.source_tags
# }