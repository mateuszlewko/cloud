provider "google" {
  project = "mlewko-182913"
  region  = "us-east1"
}

module "load-balancer" {
  source = "./load-balancer/"
  appservers = ["35.196.161.95"]
}

# module "app-server" {
#   source = "./app-server/"${format${formatlist("%s", aws_network_interface.database-lan2.*.private_ips, count.index)}${formatlist("%s", aws_network_interface.database-lan2.*.private_ips, count.index)}list("%s", aws_network_interface.database-lan2.*.private_ips, count.index)}
  
#   # environment_name = "staging"
#   # main_server_type = "f1-micro"
# }

# output "production_server_ip" {
#   value = "${module.production_environment.server_ip}"
# }
# output "staging_server_ip" {
#   value = "${module.staging_environment.server_ip}"
# }