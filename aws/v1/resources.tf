// Define the resources to create
// Provisions the following into AWS:
//    VPC, Subnet, EC2 Instance
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "main"
  }
}

resource "aws_security_group" "ssh" {
  name_prefix = "ssh-sg-"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-sg"
  }
}

resource "aws_instance" "ec2-be" {
  instance_type = var.instance_type
  ami           = "ami-04e5276ebb8451442"
  //ami           = "ami-080c353f4798a202f"
  count         = 3
  vpc_security_group_ids = [aws_security_group.ssh.id]

  subnet_id = aws_subnet.main.id
  tags = {
    name  = "ec2-be-${count.index}"
    extra = var.extra,
    sg = var.vpc_security_group_id
  }
}
