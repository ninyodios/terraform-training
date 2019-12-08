# download latest ghost image
resource "docker_image" "image_id" {
  name = "${lookup(var.image_name, var.env)}"
}

# start the container
resource "docker_container" "ubuntu_test" {
  name  = "${lookup(var.container_name, var.env)}"
  image = "${docker_image.image_id.latest}"
  ports {
    internal = "2368"
    external = "${var.external_port}"
  }
}
