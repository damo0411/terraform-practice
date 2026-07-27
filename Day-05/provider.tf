terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>6.5.0"
    }
    random = {
        source = "hashicorp/random"
        version = "~>3.1.0"
    }

  }
  required_version = "~>1.15.0"
}

provider "aws" {
  region = "ap-south-1"
}
