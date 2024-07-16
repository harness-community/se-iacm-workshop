// Define the resources to create
// Provisions the following into AWS: 
//    VCP, Subnet, EC2 Instance, S3 Bucket
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

resource "aws_instance" "ec2-be" {
  instance_type = var.instance_type
  ami           = "ami-04e5276ebb8451442"
  count         = 3

  subnet_id = aws_subnet.main.id
  tags = {
    name  = "ec2-be-${count.index}"
    extra = var.extra
  }
}
