provider "google" {
   project     = "mlewko-182913"
   region      = "us-east1"
}

### Network ###

resource "google_compute_network" "network" {
  name = "network-us-east1"
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "subnetwork-us-east1"
  ip_cidr_range = "10.0.0.0/16"
  network       = "${google_compute_network.network.self_link}"
  region        = "us-east1"
}

resource "google_compute_address" "private_ip" {
  name         = "server-private-ip"
  address_type = "INTERNAL"
  region       = "us-east1"
  subnetwork   = "${google_compute_subnetwork.subnetwork.self_link}"
}

resource "google_compute_address" "public_ip" {
  name         = "server-ip"
  address_type = "EXTERNAL"
  region       = "us-east1"
}

### Compute instances ###

resource "google_compute_instance" "web1" {
   name         = "web1"
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

  tags = ["http-server"]

  metadata {
    sshKeys = "mateuszlewko:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7IcpI6990bH9IZnQ1DvY4AW99eiYeglvIDqiBriutVcNsRhYobSeaxj+jPpPeABXh1SVMcYGqRJ47sGwsJJ4jxSkQhlMpo8z0QdNw02ocGz6eqV8pkKdFa29HkFSjUfOJjmAD8now5B8CsprZotGjgltyX5Sg/l1p9QdQ6kyCJOxAnG2/bHlBJMvsBBfLFdvRL6mM4RNUTCIo0FvFyg5beVa9n4/fZJeSbEYhA3dn3wMh9AyZvJVinxSPRWTnWUzCn3N6HtYJd1sJmqcitQpJ2wc7QPxM1FQ05FJ/zKVVBVjZmIVdRVFURwt9RAMN45ZjfPJRf7GnuBxnVqQYt4Wf"
  }

  provisioner "local-exec" {
    command = "ssh -o StrictHostKeyChecking=no mateuszlewko@${google_compute_address.public_ip.address} -- sudo apt-get -y install nginx"
  }
}

### Database ###

resource "google_sql_database_instance" "main-db-instance" {
  name             = "main-db-instance"
  database_version = "MYSQL_5_6"
  region           = "us-east1"
  project          = "mlewko-182913"

  settings {
    tier            = "db-f1-micro"
    disk_autoresize = "true"
  }
}

resource "google_sql_database" "web-db" {
  instance  = "${google_sql_database_instance.main-db-instance.name}"
  name      = "main-databasee"
}

resource "google_sql_user" "machine-user" {
  instance  = "${google_sql_database_instance.main-db-instance.name}"
  name      = "root"
  password  = "root"
  host      = "${google_compute_instance.web1.name}"
}

### Firewall ### 

resource "google_compute_firewall" "web" {
    name    = "webwall"
    network = "${google_compute_network.network.name}"

    allow {
        protocol = "tcp"
        ports    = ["80", "443"]
    }
}

# resource "google_compute_firewall" "ssh" {
# 	name = "sshwall"
# 	network = "${google_compute_network.network.name}"
	
#     allow {
#         protocol = "tcp"
#         ports = ["22"]
#     }	

# 	source_ranges = ["${var.external_net}"]
# }