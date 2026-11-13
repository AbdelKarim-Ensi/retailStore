data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "tfstate-predev-us-east-2-2o0gx4"   # ton bucket Floci
    key    = "vpc/dev/terraform.tfstate"
    region = "us-east-2"                         # même région que le bucket

    # AJOUT : config Floci
    access_key                  = "test"
    secret_key                  = "test"
    use_path_style              = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    endpoints = {
      s3 = "http://localhost:4566"
    }
  }
}

output "vpc_id" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}

output "private_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.private_subnet_ids
}

output "public_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.public_subnet_ids
}
