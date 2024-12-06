resource "aws_security_group" "web_app_sg" {
  name   = var.web_app_sg_name
  vpc_id = var.vpc_id
}

resource "aws_security_group" "db_sg" {
  name   = var.db_sg_name
  vpc_id = var.vpc_id
}

/* locals {
  sg_ids = [
    aws_security_group.web_app_sg.id,
    aws_security_group.db_sg.id
  ]
} */

resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_app_sg.id
}

resource "aws_security_group_rule" "allow_mysql" {
  //for_each = toset(local.sg_ids)
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.db_sg.id
}


resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "TCP"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_app_sg.id
}


resource "aws_security_group_rule" "allow_outbound_all" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = [ "0.0.0.0/0" ]
  security_group_id = aws_security_group.web_app_sg.id
}
