## Module OpenVPN

Terraform module which creates a OpenVPN deployment.

## Create AMI

Update packer/values.auto.pkrvars.hcl with correct values:
```
vpc_id = "vpc-0df841b82d59f0058"
region = "eu-central-1"
subnet_id = "subnet-077c707b764a8be44"
profile = cache
```

Run build:
```
cd packer
packer build .
```

## Usage

To getting started make use of the module by adding the following line to Terraform file (e. g. `variables.tf`):

```terraform
variable "region"                  { default = "us-east-1" }
variable "keyname"                 { default = "#######" }

#EC2
variable "instance_type"           { default = "t2.nano" }
variable "key_name"                { default = "root" }
variable "owner"                   { default = "#########" }

2. Then create the infrastructure by terraform.

Before you create don't forget overflow variables!!!

```
terraform init