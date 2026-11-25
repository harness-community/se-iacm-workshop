//Define the provider and any data sources
provider "aws" {
  region = "us-east-1"
}

// Latest Amazon Linux 2023 (kernel 6.1, as before), so the lab never points at a deprecated image
data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-6.1-x86_64"]
  }
}
