provider "aws" {

  region = var.region
}

#VPC

resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "dedicated"

  tags     = local.tags
}

#subnet
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags     = local.tags
  
}


#IGA
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags     = local.tags
}

#route_table
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags     = local.tags
}

# resource "aws_default_route_table" "default_route_table" {
#   default_route_table_id  = "${aws_vpc.vpc.default_route_table_id}"

#   tags     = "${local.tags}"
# }

resource "aws_route_table_association" "rta_subnet" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}




# Security group
resource "aws_security_group" "security_group" {
  name        = "public-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    #cidr_blocks = var.access_ip
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


data "aws_ami" "server_ami" {
  most_recent = true

  owners = ["679593333241"]

  filter {
      name   = "name"
      values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }


}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.server_ami.id
  
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet.id
 
  
}