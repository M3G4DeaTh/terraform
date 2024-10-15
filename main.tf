terraform {
    required_providers{
        docker = {
            source = "kreuzwerker/docker"
        }
    }
}

provider "docker" {
    host = "unix://Users/PokeySpace/.docker/run/docker.sock"
}

resource "docker_image" "nginx" {
    name = "nginx:latest"
}

resource "docker_container" "nginx" {
    image = docker_image.nginx.image
    name = "nginx1"
    ports {
        internal = 80
        external = 8080
    }
}