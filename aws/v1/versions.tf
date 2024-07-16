//Version requirements or limitations 
//As well as location to define remote backend for storing state
terraform {
  //required_version = ">= 0.15, < 1.1"
  //using OpenTofu v1.6.2

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
