build {
  sources = [
    "source.amazon-ebs.grafana"
  ]

  provisioner "file" {
    source = "grafana/grafana.ini"
    destination = "/tmp/"
  }

  provisioner "file" {
    source = "prometheus/prometheus.service"
    destination = "/tmp/"
  }

  provisioner "file" {
    source = "prometheus/prometheus.yml"
    destination = "/tmp/"
  }

  provisioner "file" {
    source = "statsd-exporter/mapping.yml"
    destination = "/tmp/"
  }

  //  provisioner "shell" {
  //    inline = [
  //      "sudo aws s3 cp s3://s77bucket/grafana.ini /tmp/",
  //      "sudo aws s3 cp s3://s77bucket/prometheus.yml /tmp/"
  //    ]
  //  }

  provisioner "shell" {
    execute_command = "sudo '{{ .Path }}'"
    scripts = [
      "./prometheus/prometheus.sh",
      "./statsd-exporter/statsd-exporter.sh",
      "./grafana/grafana.sh"
    ]
  }
}



