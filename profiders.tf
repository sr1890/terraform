provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket         = "terraform-backend-1890"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "JavaHomeVpc-tf"
  }
}
