source "docker" "ubuntu" {
  image       = "ubuntu:latest"
  export_path = "output-docker/"
}
packer {
  required_plugins {
    docker = {
      source = "github.com/hashicorp/docker"
      version = "~> 1"
    }
    ansible = {
      source = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
  }
}

build {
  sources = ["source.docker.ubuntu"]
  provisioner "ansible" {
    playbook_file = "playbook.yml"
  }
  post-processor "docker-tag" {
    repository = "ThibaultTMTC/voting-app-azure-vote-front"
    tag        = "latest"
  }
}
