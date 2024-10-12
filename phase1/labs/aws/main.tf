# Configure the AWS Provider
# Define the region variable
variable "aws_region" {
  description = "The AWS region to deploy the CTF lab"
  type        = string
  default     = "us-east-1"  # Default region if not specified
}

# Configure the AWS Provider with the variable region
provider "aws" {
  region = var.aws_region
}

# Create a VPC
resource "aws_vpc" "ctf_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "CTF Lab VPC"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "ctf_igw" {
  vpc_id = aws_vpc.ctf_vpc.id

  tags = {
    Name = "CTF Lab IGW"
  }
}

# Create a Subnet
resource "aws_subnet" "ctf_subnet" {
  vpc_id     = aws_vpc.ctf_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "CTF Lab Subnet"
  }
}

# Create a Route Table
resource "aws_route_table" "ctf_route_table" {
  vpc_id = aws_vpc.ctf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ctf_igw.id
  }

  tags = {
    Name = "CTF Lab Route Table"
  }
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "ctf_route_table_assoc" {
  subnet_id      = aws_subnet.ctf_subnet.id
  route_table_id = aws_route_table.ctf_route_table.id
}

# Create a Security Group
resource "aws_security_group" "ctf_sg" {
  name        = "ctf_sg"
  description = "Security group for CTF lab"
  vpc_id      = aws_vpc.ctf_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "CTF Lab Security Group"
  }
}

# Data source for the setup script
data "template_file" "user_data" {
  template = file("${path.module}/ctf_setup.sh")
}

# Create an EC2 Instance
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "ctf_instance" {
  ami           = data.aws_ami.amazon_linux_2.id  # Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
  instance_type = "t2.micro"
  # Remove the key_name attribute

  vpc_security_group_ids = [aws_security_group.ctf_sg.id]
  subnet_id              = aws_subnet.ctf_subnet.id

  associate_public_ip_address = true

  user_data = data.template_file.user_data.rendered

  tags = {
    Name = "CTF Lab Instance"
  }
}

# Output the public IP of the instance
output "ctf_instance_public_ip" {
  value = aws_instance.ctf_instance.public_ip
}