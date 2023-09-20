

terraform {

    required_version = ">= 2.0"

    required_providers {
        aws = { 
            source = "hashicorp/aws"
            version = "~> 4.62"
        }
    }
}