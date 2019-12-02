#################
### VARIABLES ###
#################
variable "image_name" {
  description = "Docker image name"
  default = "ghost:alpine"
}

variable "container_name" {
  description = "Container name"
  default = "afro_test"
}

variable "external_port" {
  description = "External port"
  default = "80"
}

#################
### RESOURCES ###
#################
# download latest ghost image
resource "docker_image" "image_id" {
  #name = "ghost:alpine"
  name = "${var.image_name}"
}

# start the container
resource "docker_container" "ubuntu_test" {
  name  = "${var.container_name}"
  image = "${docker_image.image_id.latest}"
  ports {
    internal = "2368"
    external = "${var.external_port}"
  }
}
##############
### OUTPUT ###
##############
output "container_name" {
  value       = "${docker_container.ubuntu_test.name}"
  description = "Output test - should print Docker container name"
}
output "container_ip" {
  value       = "${docker_container.ubuntu_test.ip_address}"
  description = "Output test - should print Docker container ip"
}
