terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  
}

# 馬鹿かお前
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-from-everywhere"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}