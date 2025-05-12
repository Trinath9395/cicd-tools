terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 5.95.0"
    }
  }


  backend "s3" {
    bucket = "cicd-tools-practice"
    key = "cicd-tools"
    region = "us-east-1"
    dynamodb_table = "cicd-locking"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}