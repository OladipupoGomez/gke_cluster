resource "google_compute_firewall" "default" {
  name    = GCP_FIREWALL_NAME
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = GCP_FIREWALL_PROTOCOLS
    ports    = GCP_FIREWALL_PORTS
  }

  source_tags = GCP_FIREWALL_SOURCE_TAGS
}

resource "google_compute_network" "default" {
  name = GCP_NETWORK_NAME
}