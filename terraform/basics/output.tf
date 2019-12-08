output "container_name" {
  value       = "${docker_container.ubuntu_test.name}"
  description = "Output test - should print Docker container name"
}
output "container_ip" {
  value       = "${docker_container.ubuntu_test.ip_address}"
  description = "Output test - should print Docker container ip"
}
