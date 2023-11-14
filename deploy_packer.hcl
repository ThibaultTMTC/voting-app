source "docker" "ubuntu" {
  image       = "ubuntu:latest"
  export_path = "output-docker/"
}

build {
  sources = ["source.docker.ubuntu"]
  provisioner "ansible" {
    playbook_file = "playbook.yml"
  }
  post-processor "docker-tag" {
    repository = "ThibaultTMTC/azure-vote-main-code"
    tag        = "latest"
  }
}
