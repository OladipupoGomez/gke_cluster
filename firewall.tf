resource "google_compute_firewall" "default" {
  name    = "Gomez-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = ["tcp", "http"]
    ports    = ["80", "8080",]
  }

  source_tags = ["web"]
}

resource "google_compute_network" "default" {
  name = "Gomez-network"
}