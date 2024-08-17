resource "google_compute_network" "net" {
  name = GCP_NETWORK_NAME
}

resource "google_compute_subnetwork" "subnet" {
  name          = GCP_SUBNETWORK_NAME
  network       = google_compute_network.net.id
  ip_cidr_range = GCP_SUBNETWORK_CIDR_RANGE
  region        = GCP_REGION
}

resource "google_compute_router" "router" {
  name    = GCP_ROUTER_NAME
  region  = google_compute_subnetwork.subnet.region
  network = google_compute_network.net.id
}

resource "google_compute_address" "address" {
  count  = 2
  name   = "nat-manual-ip-${count.index}"
  region = google_compute_subnetwork.subnet.region
}

resource "google_compute_router_nat" "nat_manual" {
  name   = GCP_ROUTER_NAT_NAME
  router = google_compute_router.router.name
  region = google_compute_router.router.region

  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips                = google_compute_address.address.*.self_link

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.subnet.id
    source_ip_ranges_to_nat = GCP_NAT_SOURCE_IP_RANGES
  }
}