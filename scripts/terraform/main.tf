# These variables are declared, its value can be accessed from within expressions 
# as var.<NAME> 

variable "aws_region" { default = "eu-west-1"}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default = "10.0.2.0/24"
}

# Configurations for a given provider name that you will have to change depending on the availability zone.
provider "aws" {
    region     = "${var.aws_region}"
    access_key = ""
    secret_key = ""
}

# extract Aws ubuntu Amazon image (Ami)
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name      = "name"
    values    = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name      = "virtualization-type"
    values    = ["hvm"]
  }
  owners      = ["099720109477"]
}

# Creating a key pair used to control login access to EC2 instances. You have to specify your own key.
resource "aws_key_pair" "admin" {
  key_name   = "admin.key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDO0cD6HK2cPutURkX11lR1DG1+/Ry1t3Jp+RCTybp3wFVHCKitCcwqyZEhGuviTLJgCaL71xiKjkKjt9VoIEi7FnJ+gQdRC/OTc6RwhUYdox5mgOeM/1erb1949eD0OE2mVAw/al+xPZBTOejTQzRgOvIfEP7y0WlM3dAOqAgTCvJnysxxmHUh7skCt6mxLK5tpTmnpEb9bFXTIcbMKtKhLGkOImOUeVTRQePS4E2IImLouAl+QFbmbfxPM6A962FSGL1iZXF/Pkkm8IfSaUybkx+mcV4zD/l8BfYhNYJSujVJn/OoE99/2escJFoJBvgkRVNkAf583wrlx1M9k3Il nel@nel"
}

# Creating a VPC with CIDR 10.0.0.0/16
resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

# Define gateway for VPC
resource "aws_internet_gateway" "gw" {
  vpc_id      = "${aws_vpc.main.id}"
}

resource "aws_route_table" "web-public-rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table_association" "web-public-rt" {
  subnet_id = "${aws_subnet.rudder.id}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}

# Creating a public subnet inside VPC with CIDR 10.0.1.0/24
resource "aws_subnet" "rudder" {
  vpc_id      = "${aws_vpc.main.id}"
  cidr_block  = "${var.public_subnet_cidr}"

  tags = {
    Name = "rudder"
  }
}

# Creating a private subnet inside VPC with CIDR 10.0.2.0/24
resource "aws_subnet" "private-subnet" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${var.private_subnet_cidr}"
}


# Creating security groups for instances, you will have to specify only the concerned ports
resource "aws_security_group" "allow_remote_admin" {
  name        = "allow_remote_admin"
  description = "Allow ssh and RDP inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


# create Rudder instance server. You can replace "latest" with a specific setup-server version and put you private-key PATH.
resource "aws_instance" "rudder-terra-server" {
    ami           = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.small"
    key_name      = "${aws_key_pair.admin.key_name}"  
    subnet_id     = "${aws_subnet.rudder.id}"

    associate_public_ip_address = true

    tags = {
        Name  = "rudder-terra-server"
    }

    security_groups = [
        "${aws_security_group.allow_remote_admin.id}"
    ]
    
    provisioner "remote-exec" {
    	inline = [ 
	"sudo wget https://repository.rudder.io/tools/rudder-setup",
	"sudo chmod +x rudder-setup",
	"sudo ./rudder-setup setup-server latest"
	]

        connection {
		type = "ssh"
		user = "ubuntu"
		private_key = "${file("KEY PATH")}"
		host = "${aws_instance.rudder-terra-server.public_dns}"  	
    	}
    }   
}

# create Rudder instance agent. You can replace "latest" with a specific setup-agent version and put your private-key PATH.
resource "aws_instance" "rudder-terra-agent" {
    ami           = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    key_name      = "${aws_key_pair.admin.key_name}"  
    subnet_id     = "${aws_subnet.rudder.id}"

    associate_public_ip_address = true

    tags = {
        Name  = "rudder-terra-agent"
    }

    security_groups = [
        "${aws_security_group.allow_remote_admin.id}"
    ]
    

    provisioner "remote-exec" {
    	inline = [ 
	"sudo wget https://repository.rudder.io/tools/rudder-setup",
	"sudo chmod +x rudder-setup",
	"sudo ./rudder-setup setup-agent latest ${aws_instance.rudder-terra-server.private_ip}"
	]

        connection {
		type = "ssh"
		user = "ubuntu"
		private_key = "${file("KEY PATH")}"
		host = "${aws_instance.rudder-terra-agent.public_dns}"	
    	}
    }   
}


