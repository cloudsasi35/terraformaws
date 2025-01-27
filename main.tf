provider "aws" {
  region = "ap-south-1"
}

# Create a security group
/*resource "aws_security_group" "ec2_sg" {
  name_prefix = "ec2-sg-"
  description = "Allow SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}*/

# Define the EC2 instance
resource "aws_instance" "ubuntu_vm" {
  ami           = "ami-00bb6a80f01f03502" # Ubuntu 20.04 LTS in us-east-1
  instance_type = "t2.micro" # Change this based on your requirements

  key_name      = "geeawskey"
  vpc_security_group_ids = ["sg-033ffbe6ea3ec486d"]

  tags = {
    Name = "Ubuntu-VM"
  }
}

# Output the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.ubuntu_vm.public_ip
}