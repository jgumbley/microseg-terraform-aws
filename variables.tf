variable "aws_access_key" {}
variable "aws_secret_key" {}

resource "aws_key_pair" "pub" {
  key_name = "jim" 
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpHRcKm+KlrKS6frOsnK9pIYBI3sQ6HJzqvpN/lt7qFh3juiGU8YCKd4Hll5+yNH+VMQ+Ki1TY7Ikzib1Ll/gefURs8rvMAr4Jbd+LxTDPYFiG6TsiY3Ci5wA+SZKnFOYZzOhHJzvrruEefU0Vk1yyxYWTiDe+i8tl0V232KQHcDgJLqwc00kJ26LO7oJI3OSi8r6Cr8mVJdbcXZYzoRnBG/J5na/gb25TD174DIoB5dV5L2OQoevF8zW0BPR+ccMfJC3n3XhMLKKj/nuyhsycEiZq890DnwuiPcgTpUn4AQZFYcL1/mTShgxGZCzZ2XdPE9rx63f1kWXhXdh9C/Pp jgumbley@thoughtworks.com"
}

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

