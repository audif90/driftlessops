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

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-from-everywhere"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

# 馬鹿かお前
#   source_ranges = ["0.0.0.0/0"]

  source_ranges = ["1.2.3.4/32"] 


}