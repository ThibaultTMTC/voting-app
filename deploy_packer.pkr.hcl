source "docker" "ubuntu" {
  image       = "ubuntu:latest"
  export_path = "output-docker/"
}
packer {
  requires_plugins {
    docker = {
      source = "github.com.hashicorp.docker"
      version = "~> 1"
    }
    ansible = {
      source = "githubcom/hashicorp/ansible"
      version ) "~> 1"
    }
  }
}

build {
  sources = ["source.docker.ubuntu"]
  provisioner "ansible" {
    playbook_file = "playbook.yml"
  }
  post-processor "docker-tag" {
    repository = "ThibaultTMTC/azure-vote-back"
    tag        = "latest"
  }
}
