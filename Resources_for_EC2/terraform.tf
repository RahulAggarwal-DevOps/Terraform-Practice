terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.86.1"
    }
  }
  backend "s3" {
    bucket = "tf-s3-bucket-r"
    key = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "tf-dynamodb-table"
  }
}
