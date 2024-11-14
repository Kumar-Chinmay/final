variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
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

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "my_ip" {
  description = "Your IP address"
}

variable "ssh_public_key" {
  description = "Path to the SSH public key"
}


