resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = "vpc-017e7031fcae730cb"
  cidr_block        = var.public_subnet_1_cidr
  availability_zone = var.az_1
  map_public_ip_on_launch = true
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id            = "vpc-017e7031fcae730cb"
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = var.az_2
  map_public_ip_on_launch = true
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet"
}

variable "az_1" {
  description = "Availability Zone for the first public subnet"
}

variable "az_2" {
  description = "Availability Zone for the second public subnet"
}
