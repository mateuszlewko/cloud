variable "app-ip-addresses" {
  type        = "list"
  description = "List of ip addresses for app servers."
}

### Network ###

resource "google_compute_network" "network" {
  name = "lb-network-us-east1"
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "lb-subnetwork-us-east1"
  ip_cidr_range = "10.0.0.0/16"
  network       = "${google_compute_network.network.self_link}"
  region        = "us-east1"
}

resource "google_compute_address" "private_ip" {
  name         = "lb-server-private-ip"
  address_type = "INTERNAL"
  region       = "us-east1"
  subnetwork   = "${google_compute_subnetwork.subnetwork.self_link}"
}

resource "google_compute_address" "public_ip" {
  name         = "lb-server-ip"
  address_type = "EXTERNAL"
  region       = "us-east1"
}

### Compute instances ###

resource "google_compute_instance" "load-balancer" {
   name         = "load-balancer"
   machine_type = "n1-standard-1"
   zone         = "us-east1-b"

   boot_disk {
    initialize_params {
      image = "debian-cloud/debian-8"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.subnetwork.self_link}"
    address    = "${google_compute_address.private_ip.address}"

    access_config {
      nat_ip = "${google_compute_address.public_ip.address}"
    }
  }

  tags = ["loadbalancer"]

  metadata {
    sshKeys = "mateuszlewko:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7IcpI6990bH9IZnQ1DvY4AW99eiYeglvIDqiBriutVcNsRhYobSeaxj+jPpPeABXh1SVMcYGqRJ47sGwsJJ4jxSkQhlMpo8z0QdNw02ocGz6eqV8pkKdFa29HkFSjUfOJjmAD8now5B8CsprZotGjgltyX5Sg/l1p9QdQ6kyCJOxAnG2/bHlBJMvsBBfLFdvRL6mM4RNUTCIo0FvFyg5beVa9n4/fZJeSbEYhA3dn3wMh9AyZvJVinxSPRWTnWUzCn3N6HtYJd1sJmqcitQpJ2wc7QPxM1FQ05FJ/zKVVBVjZmIVdRVFURwt9RAMN45ZjfPJRf7GnuBxnVqQYt4Wf"
  }

  provisioner "local-exec" {
    command = "echo  ${var.app-ip-addresses[0]}"
  }
}

### Firewall ### 

resource "google_compute_firewall" "ssh" {
	name        = "lb-sshwall"
	network     = "${google_compute_network.network.name}"
	target_tags = ["loadbalancer"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }	
                   # my ip address    # uni ip address
	source_ranges = ["83.26.108.8/32", "156.17.4.0/24"]
}

# resource "google_compute_firewall" "app-traffic" {
#   TODO: traffic to/from app servers
#   # name        = "webwall"
#   # network     = "${google_compute_network.network.name}"
#   # target_tags = ["web"]

#   # allow {
#   #   protocol = "tcp"
#   #   ports    = ["80", "443"]
#   # }
# }

### Outputs ###
output "loadbalancer ip address" {
  value = "${google_compute_instance.load-balancer.network_interface.0.access_config.0.assigned_nat_ip}"
}