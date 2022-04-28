resource "aws_vpc" "P1P6" {
  cidr_block = "${var.cidr_block}.0.0/16"
}

resource "aws_internet_gateway" "P1P6" {
 vpc_id =  aws_vpc.P1P6.id
}

resource "aws_subnet" "P1P6-az1" {
  vpc_id = aws_vpc.P1P6.id
  cidr_block = "${var.cidr_block}.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_security_group" "P1P6-SG-WEB" {
  name = "P1P6-SG-WEB"
  vpc_id = aws_vpc.P1P6.id
  ingress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "SSH"
    from_port = 22
    protocol = "-1"
    to_port = 22
  }, {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "HTTP"
    from_port = 80
    protocol = "-1"
    to_port = 80
  },{
  cidr_blocks = [ "0.0.0.0/0" ]
    description = "HTTPS"
    from_port = 443
    protocol = "-1"
    to_port = 443}
  ]
  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "P1P6"
    protocol = "-1"
  } ]
}

resource "aws_security_group" "P1P6-SG-Interno" {
  name = "P1P6-Interno"
  vpc_id = aws_vpc.P1P6.id
  ingress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "SSH"
    from_port = 22
    protocol = "-1"
    to_port = 22
  }, {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "HTTP"
    from_port = 8080
    protocol = "-1"
    to_port = 8080
  },{
  cidr_blocks = [ "0.0.0.0/0" ]
    description = "HTTPS"
    from_port = 3306
    protocol = "-1"
    to_port = 3306}
  ]
  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "P1P6"
    protocol = "-1"
  } ]
}