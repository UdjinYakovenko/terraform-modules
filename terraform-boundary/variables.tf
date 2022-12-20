variable "name_prefix" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "priv_ssh_key_real"       { default = "~/ndcroot1.pem" }


#RDS
variable "identifier"              { default = "boundary-db" }
variable "storage"                 { default = "5" }
variable "storage_type"            { default = "gp2" }
variable "engine"                  { default = "postgres" }
variable "engine_version"          { default = "13.3"}
variable "db_instance_class"       { default = "db.m5.large"}
variable "db_name"                 { default = "myBoundaryDb"}
variable "parameter_group_name"    { default = "default.postgres13" }
variable "username"                { default = "DBadmin" }
variable "password"                { default = "Ghjibdrf" }
variable "snapshot"                { default = "Boundary-Backup" }

#VPC
variable "cidrs" {
  description = "List of CIDRs than can access to the mongodb."
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC id"
}

variable "subnet_ids" {
  description = "List of subnet Ids"
  type        = list(string)
}

variable "availability_zone" {
  description = "Availability zones for VPC"
  type        = list(string)
}

variable "tls_disabled" {
  default = true
}

variable "kms_type" {
  default = "aws"
}

variable "tls_key_path" {
  default = "/etc/pki/tls/boundary/boundary.key"
}

variable "tls_cert_path" {
  default = "/etc/pki/tls/boundary/boundary.cert"
}

variable "num_controllers" {
  default = 1
}

variable "pub_ssh_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "priv_ssh_key_path" {
  default = "~/ndcroot1.pem"
}