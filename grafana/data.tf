data "aws_ami" "Garafana" {
  most_recent = true
  owners      = [var.owner]
  
   filter {
    name      = "name"
    values    = ["Grafana*"]
  }
}