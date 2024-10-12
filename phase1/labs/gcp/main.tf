# Define the project variable
variable "gcp_project" {
  description = "The GCP project to deploy the CTF lab"
  type        = string
}

# Define the region variable
variable "gcp_region" {
  description = "The GCP region to deploy the CTF lab"
  type        = string
  default     = "us-central1"
}

# Define the zone variable
variable "gcp_zone" {
  description = "The GCP zone to deploy the CTF lab"
  type        = string
  default     = "us-central1-a"
}

# Configure the Google Cloud provider
provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

# Create a VPC network
resource "google_compute_network" "ctf_network" {
  name                    = "ctf-network"
  auto_create_subnetworks = false
}

# Create a subnet
resource "google_compute_subnetwork" "ctf_subnet" {
  name          = "ctf-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.gcp_region
  network       = google_compute_network.ctf_network.id
}

# Create a firewall rule to allow SSH
resource "google_compute_firewall" "ctf_firewall_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.ctf_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Enable OS Login
resource "google_compute_project_metadata_item" "os_login" {
  key   = "enable-oslogin"
  value = "TRUE"
}

# Create a Compute Engine instance
resource "google_compute_instance" "ctf_instance" {
  name         = "ctf-instance"
  machine_type = "e2-micro"
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network    = google_compute_network.ctf_network.name
    subnetwork = google_compute_subnetwork.ctf_subnet.name

    access_config {
      // This empty block will create an ephemeral external IP
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  metadata_startup_script = file("${path.module}/ctf_setup.sh")

  tags = ["ctf-lab"]

  service_account {
    scopes = ["cloud-platform"]
  }
}

# Output the external IP of the instance
output "ctf_instance_external_ip" {
  value = google_compute_instance.ctf_instance.network_interface[0].access_config[0].nat_ip
}

# Output the project
output "gcp_project" {
  value = var.gcp_project
}

# Output the region
output "gcp_region" {
  value = var.gcp_region
}