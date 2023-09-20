
variable "ACCESS_KEY" { 
    description = "Access Key"
    sensitive = true
    type = string 
    default = "XX"
}

variable "SECRET_KEY" { 
    description = "Secret Key"
    sensitive = true
    type = string 
    default = "XX"
}

variable "env" { 
    description = "Environment Variable" 
    type = string
}

variable "vpc_cidr_block" {
    description = "CIDR"
    type = string
    default = "10.0.0.0/16"
}

variable "azs" { 
    description = "Availablility zones for subnets"
    type = list(string)
}

variable "private_subnets"  {
    description = "CIDR for private subnets"
    type = list(string)
}

variable "public_subnets" {
    description = "CIDR for public subnets"
    type = list(string)
}

variable "private_subnet_tags" {
    description = "Private subnet tags"
    type = map(any)
}

variable "public_subnet_tags" {
    description = "Private subnet tags"
    type = map(any)
}

