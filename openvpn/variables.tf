variable "owner" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

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