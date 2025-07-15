resource "aws_security_group" "tfsg1" {
  name        = "tfsecgrp1"
  description = "allow SSH and HTTP access"
  vpc_id      = "vpc-0686e36c9a4be2891"

  tags = {
    Name = "tfsecgrp1"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.tfsg1.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.tfsg1.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.tfsg1.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}