
provider "aws" { 
    region = "ap-southeat-2"
    access_key = var.ACCESS_KEY
    secret_key = var.SECRET_KEY
}

terraform {
    required_version = ">= 1.0"


    required_providers {
        aws = { 
            source = "hashicorp/awp"
            version = "~>4.62"
        } 
    }
}