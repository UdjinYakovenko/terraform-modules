variable "name_prefix" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "owner" {
  type = string
}

variable "cidrs" {
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC id"
}

variable "subnet_ids" {
  description = "List of subnet Ids"
  type        = list(any)
}

variable "availability_zone" {
  description = "Availability zones for VPC"
  type        = list(string)
}


#SSL
#variable "ssl_arn"                 {}

#DB
variable "identifier"              { default = "grafana-db" }
variable "storage"                 { default = "5" }
variable "storage_type"            { default = "gp2" }
variable "engine"                  { default = "postgres" }
variable "engine_version"          { default = "13.3"}
variable "db_instance_class"       { default = "db.m5.large"}
variable "db_name"                 { default = "myTestDb"}
variable "parameter_group_name"    { default = "default.postgres13" }
variable "username"                { default = "DBadmin" }
variable "password"                { default = "Ghjibdrf" }
variable "snapshot"                { default = "Grafana-Backup" }

#Route53
# variable "domain_link"             { default = "example.local" }

#S3
variable "s3_bucket_name"          { default = "garafana-conf-bucket" }

variable "s3_bucket_acl" {
  description = "Allow public read access to bucket"
  default     = "private"
}

variable "s3_bucket_force_destroy" {
  description = "Delete all objects in bucket on destroy"
  default     = false
}

variable "versioning" {
  description = "Version the bucket"
  default     = true
}