variable "region"                  { default = "us-east-1" }
variable "keyname"                 { default = "NDC" }

#EC2
variable "instance_type"           { default = "t2.medium" }
variable "key_name"                { default = "ndcroot" }
variable "owner"                   { default = "027553322508" }

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