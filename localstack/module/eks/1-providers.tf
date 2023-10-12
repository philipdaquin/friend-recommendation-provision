provider "aws" {
    access_key                  = "test"
    secret_key                  = "test"
    region                      = "us-east-2"
    s3_use_path_style           = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
  
    endpoints {
        ec2 = "http://localhost:4566"
        iam = "http://localhost:4566"
        sts            = "http://localhost:4566"
        eks            = "http://localhost:4566"
    }
}

