# Boundary

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

## First start
 The first start is done manually:
 1. Initialize base "sudo boundary database init -config /etc/boundary-controller.hcl"
 2. Save output.
 	Example:
     ```
 		Initial auth information:
  		Auth Method ID:     ampw_1ALMo45VQB
  		Auth Method Name:   Generated global scope initial auth method
  		Login Name:         admin
  		Password:           oLKRhlzUGLDUcw4yA6jX
  		Scope ID:           global
  		User ID:            u_2taxYtcqkO
  		User Name:          admin
    ```
 	
 3. Install controller:
 	sudo ./install.sh controller
 4. Install worker:
 	sudo ./install.sh worker
	 
## Try it out
Now that all services are running, open a browser and go to http://127.0.0.1:9200/ If everything went well, you should see the UI of Boundary, and you can log in with the credentials created when initializing the database.