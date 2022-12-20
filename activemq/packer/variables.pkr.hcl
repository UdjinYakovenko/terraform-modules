variable "designator" {
  type = string
}

variable "profile" {
  type = string
}

variable "vpc_id" {
  description = "The VPC you're building AMI's in"
  type = string
}

variable "region" {
  description = "The AWS region you're using"
  type = string
}

variable "subnet_id" {
  description = "The Subnet to build the AMI inm that's ssh'able"
  type = string
}

variable "BUILD_NUMBER" {
  description = "The build number"
  type = string
  default = "1"
}

variable "instance_type" {
  default = "t3.large"
  description = "The AMI build instance"
  type = string
}

variable "ami_users" {
  default = []
}

variable "associate_public_ip_address" {
  type = bool
  default = true
}

variable "ssh_interface" {
  type = string
  default = "public_ip"
}

variable "ssh_key" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCcPkJjHgBql8WY2vfECyr7bP36cNWSSWGGt56AYGb0QDzvmCvCIr2hcs8052HGqy4UkJyhsVF60jx4eMBztzP5weCWUc1+MsDQBcTqKobgPkLhKd2kA4Jk8uJIpSZnvdH+D5PONMzsVWQQrrThczHkuC7sfWs7BdLzVMMqezNv8kldjhwkcoarJD37i5e12KoNggZpzsh6TIcG/tQABFA9KrDEw2oyEEclloOLxY7nHsj2DKPcq8pP2UkWybtgfNLO8KvpXZ3vS0PdTWmIL6tDZhbeuuqI0WbiFA8AKznDkmzs+d1nD9ixcqLSUrxMdytJCkPPluESzYL/Za/3QeTd ec2-user@ip-172-31-102-53.eu-central-1.compute.internal"
}