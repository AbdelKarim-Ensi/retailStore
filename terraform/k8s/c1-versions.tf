terraform {
  required_version = ">= 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }

  backend "s3" {
    bucket       = "tfstate-predev-us-east-2-2o0gx4"
    key          = "eks/dev/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true

    # AJOUT : config Floci
    access_key                  = "test"
    secret_key                  = "test"
    use_path_style              = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_s3_checksum            = true

    endpoints = {
      s3 = "http://localhost:4566"
    }
  }
}

provider "aws" {
  region = var.aws_region

  # AJOUT : config Floci
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_use_path_style           = true

  endpoints {
    s3  = "http://localhost:4566"
    ec2 = "http://localhost:4566"
    iam = "http://localhost:4566"
    sts = "http://localhost:4566"
    eks = "http://localhost:4566"
  }
}
