## Module Grafana

Terraform module which creates a Grafana deployment.

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

#SSL
#variable "ssl_arn"                {}

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
variable "password"                { default = "#######" }
variable "snapshot"                { default = "Grafana-Backup" }

#Route53
variable "domain_link"             { default = "example.local" }

#S3
variable "s3_bucket_name"          { default = "s3.grafana.bucket" }
```

2. Then create the infrastructure by terraform.

Before you create don't forget overflow variables!!!

Route 53

You can add a basic CNAME entry with the following, Or if you're are using an "apex" domain (e.g. example.com) consider using an Alias

```
terraform init
```

3. Take RDS enpoint and incert into config garafana.ini and fill in the rest of the data.

```
type = ###
host = ###
name = ###
user = ###
password = ###
```

Don't foget to update garafana.ini on S3Bucket!!

The create AMI template again.

4. Finally re-create infrastructure by terraform for update Instances.

### Explore
Terraform will output the Grafana DNS. Go there and check the eight configured dashboards.