/*

We need a

- VPC (cross region, az, logical container)
- Security Group

*/

resource "aws_vpc" "flat_segment" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "terraform-aws-vpc"
    }
}

resource "aws_security_group" "web" {
    name = "vpc_web"
    vpc_id = "${aws_vpc.flat_segment.id}"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.flat_segment.id}"
}

resource "aws_subnet" "flat_subnet" {
    vpc_id = "${aws_vpc.flat_segment.id}"
    cidr_block = "${var.flat_cidr}"
    availability_zone = "${var.aws_az}"
}

resource "aws_route_table" "flat_route_table" {
    vpc_id = "${aws_vpc.flat_segment.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }
}

resource "aws_instance" "web-1" {
    ami = "${lookup(var.deployables, var.aws_region)}"
    availability_zone = "${var.aws_az}"
    instance_type = "t2.small"
    security_groups = ["${aws_security_group.web.id}"]
    subnet_id = "${aws_subnet.flat_subnet.id}"
    associate_public_ip_address = true
    source_dest_check = false
}

resource "aws_eip" "web-1" {
    instance = "${aws_instance.web-1.id}"
    vpc = true
}
