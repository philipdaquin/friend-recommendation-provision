locals {
  env         = "dev"
  region      = "us-east-2"
  zone1       = "us-east-2a"
  zone2       = "us-east-2b"
  eks_name    = "demo"
  eks_version = "1.27"
  
  ssh_user    = "ubuntu"
  key_name    = "devops"
  private_key_path = "../devops.pem"


  instance_type = "t2.micro"

}