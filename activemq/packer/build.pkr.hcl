build {
  sources = [
    "source.amazon-ebs.ami"
  ]

  provisioner "file" {
    source      = "upload"
    destination = "/tmp"
  }

  provisioner "shell" {
    inline = [
      "sudo mkdir -p /opt",
      "sudo cp -R /tmp/upload /opt",
      "sudo ls -l /opt",
      "echo \"${var.ssh_key}\" | sudo tee -a /home/ec2-user/.ssh/authorized_keys"
    ]
  }

  provisioner "shell" {
    #    execute_command = "sudo '{{ .Path }}'"
    inline = [
      "sudo /bin/bash /opt/upload/install.sh"
    ]
  }
}


