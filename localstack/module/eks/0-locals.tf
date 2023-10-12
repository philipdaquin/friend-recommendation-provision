locals {
  env         = "dev"
  region      = "us-east-2"
  zone1       = "us-east-2a"
  zone2       = "us-east-2b"
  eks_name    = "demo"
  eks_version = "1.27"
  instance_type = "t3.small"
  capacity_type = "ON_DEMAND"
}