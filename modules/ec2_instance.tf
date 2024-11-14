provider "aws" {
  region = "us-east-2"
}

provider "tls" {}

# Generate an SSH key pair using the tls_private_key resource
resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create AWS Key Pair using the generated public key
resource "aws_key_pair" "web_key" {
  key_name   = "web-key"
  public_key = tls_private_key.mykey.public_key_openssh
}

# Launch EC2 instance using the generated SSH key
resource "aws_instance" "tcs-user11vmfinaldev" {
  ami           = "ami-0ea3c35c5c3284d82"  # Replace with the correct AMI ID for your region
  instance_type = var.instance_type
  key_name      = aws_key_pair.web_key.key_name
  subnet_id     = aws_subnet.public_subnet_1.id
  security_groups = [aws_security_group.allow_http_ssh.name]

  tags = {
    Name = "tcs-user11vmfinaldev"
  }
  associate_public_ip_address = true  # Ensure the instance gets a public IP
}

# Output the public IP of the EC2 instance
output "instance_public_ip" {
  value = aws_instance.tcs-user11vmfinaldev.public_ip
}

# Optionally, output the private key (use with caution)
output "private_key" {
  value     = tls_private_key.mykey.public_key_openssh
  sensitive = true  # This will prevent the private key from being shown in the output
}


variable "instance_type" {
  description = "Instance type for the EC2 instance"
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
}

variable "security_group_id" {
  description = "Security group ID for the EC2 instance"
}

variable "ssh_public_key" {
  description = "Path to the SSH public key file"
}
