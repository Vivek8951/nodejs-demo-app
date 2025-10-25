terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pull the Docker image from Docker Hub
resource "docker_image" "nodejs_app" {
  name         = "viveks895/nodejs-demo-app:latest"
  keep_locally = false
}

# Create a Docker container
resource "docker_container" "nodejs_app" {
  name  = "terraform-nodejs-app"
  image = docker_image.nodejs_app.image_id

  ports {
    internal = 3000
    external = 3000
  }
}
