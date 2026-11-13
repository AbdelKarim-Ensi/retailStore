terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
  # Remote Backend
  backend "s3" {
    encrypt      = true
    use_lockfile = true
    bucket       = "tfstate-predev-us-east-2-2o0gx4"
    key          = "vpc/dev/terraform.tfstate" #la path pour enrgistrer le state de terraform dans le bucket s3
    region       = "us-east-1"                 # le variable not alow in the remote backend 

    endpoints                   = { s3 = "http://localhost:4566" }
    access_key                  = "test"
    secret_key                  = "test"
    use_path_style              = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
  }
}

provider "aws" {
  region = var.aws_region
}
