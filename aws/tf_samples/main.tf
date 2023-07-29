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
  region  = "ap-northeast-2"
  shared_config_files = ["/Users/howard/.aws/config"]
  shared_credentials_files = ["/Users/howard/.aws/credentials"]
  profile = "default"
}

resource "aws_vpc" "swit_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "swit_subnet" {
  vpc_id            = aws_vpc.swit_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_elasticache_subnet_group" "swit_elastic" {
  name       = "tf-test-cache-subnet"
  subnet_ids = [aws_subnet.swit_subnet.id]
}

resource "aws_network_interface" "swit-ec2" {
  subnet_id   = aws_subnet.swit_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_elasticache_cluster" "swit-cache" {
  cluster_id           = "cluster-example"
  engine               = "redis"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name = "tf-test-cache-subnet"

}

resource "aws_instance" "app_server" {
  ami           = "ami-0ea4d4b8dc1e46212"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.swit-ec2.id
    device_index         = 0
  }

  tags = {
    Name = var.instance_name
  }
}