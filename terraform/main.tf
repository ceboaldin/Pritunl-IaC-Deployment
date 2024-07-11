terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name : "${var.env_prefix}-vpc"
  }
}

module "myapp-subnet" {
  source                 = "./modules/subnet"
  subnet_cidr_block      = var.subnet_cidr_block
  vpc_id                 = aws_vpc.myapp-vpc.id
  avail_zone             = var.avail_zone
  env_prefix             = var.env_prefix
  default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id
}

module "myapp-webserver" {
  source                    = "./modules/webserver"
  vpc_id                    = aws_vpc.myapp-vpc.id
  env_prefix                = var.env_prefix
  public_key_location       = var.public_key_location
  instance_type             = var.instance_type
  avail_zone                = var.avail_zone
  subnet_id                 = module.myapp-subnet.subnet.id
  ansible_playbook_location = var.ansible_playbook_location
}

# resource "null_resource" "configure_server" {
#   provisioner "local-exec" {
#     working_dir = "../ansible"
#     command = "ansible-playbook -—inventory ${self.public_ip}, --user ec2-user jenkins_playbook.yaml"
#   }
# }