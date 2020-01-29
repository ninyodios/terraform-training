variable "env" {
  description = "Test, Stage or LIVE"
}

variable "image_name" {
  type        = "map"
  description = "Docker image name"
  default = {
    test  = "ghost:alpine"
    stage = "ghost:latest"
    live  = "ghost:latest"
  }
}

variable "container_name" {
  type        = "map"
  description = "Container name"
  default = {
    test  = "blog-test"
    stage = "blog-stage"
    live  = "blog-live"
  }
}

variable "external_port" {
  type        = "map"
  description = "External port"
  default = {
    test  = "8081"
    stage = "8082"
    live  = "80"
  }
}
