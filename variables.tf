variable "aws_access_key" {}
variable "aws_secret_key" {}


variable "aws_region" {
    default = "us-east-1"
}

variable "aws_az" {
    default = "us-east-1b"
}

variable "deployables" {
    default = {
        us-east-1 = "ami-65c4080e"
    }
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "flat_cidr" {
    default = "10.0.0.0/16"
}

