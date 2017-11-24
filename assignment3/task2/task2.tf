provider "google" {
  project = "mlewko-182913"
  region  = "us-east1"
}

module "load-balancer" {
  source = "./load-balancer/"
  app-ip-addresses = ["35.196.161.95"]
  # environment_name = "production"
  # main_server_type = "n1-standard-1"
}

# module "app-server" {
#   source = "./app-server/"
  
#   # environment_name = "staging"
#   # main_server_type = "f1-micro"
# }

# output "production_server_ip" {
#   value = "${module.production_environment.server_ip}"
# }
# output "staging_server_ip" {
#   value = "${module.staging_environment.server_ip}"
# }