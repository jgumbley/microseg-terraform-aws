resource "aws_vpc" "flat_segment" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "terraform-aws-vpc"
    }
}

resource "aws_security_group" "web" {
    name = "vpc_web"
    description = "Allow traffic to pass from the private subnet to the internet"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["${var.private_subnet_cidr}"]
    }

    vpc_id = "${aws_vpc.flat_segment.id}"

    tags {
        Name = "NATSG"
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.flat_segment.id}"
}

resource "aws_subnet" "flat_subnet" {
    vpc_id = "${aws_vpc.flat_segment.id}"

    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = "${var.aws_az}"

    tags {
        Name = "Public Subnet"
    }
}

resource "aws_route_table" "flat_route_table" {
    vpc_id = "${aws_vpc.flat_segment.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "Public Subnet"
    }
}

resource "aws_instance" "web-1" {
    ami = "${lookup(var.amis, var.aws_region)}"
    availability_zone = "${var.aws_az}"
    instance_type = "t2.small"
    security_groups = ["${aws_security_group.web.id}"]
    subnet_id = "${aws_subnet.flat_subnet.id}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "Web Server 1"
    }
}

resource "aws_eip" "web-1" {
    instance = "${aws_instance.web-1.id}"
    vpc = true
}
