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
    external = "${lookup(var.external_port, var.env)}"
  }
}

# invokes a local executable after a resource is created. This invokes a process on the machine running Terraform, not on the resource.
resource "null_resource" "null_id" {
  provisioner "local-exec" {
    command = "echo ${docker_container.ubuntu_test.name}:${docker_container.ubuntu_test.ip_address} >> container.txt"
  }
}
