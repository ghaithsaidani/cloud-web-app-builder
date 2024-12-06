output "web_app_sg_id" {
  value = aws_security_group.web_app_sg.id
}

output "connected_to_rds_web_app_sg_id" {
  value = aws_security_group.connected_to_rds_web_app_sg.id
}

output "db_sg_id" {
  value = aws_security_group.db_sg.id
}

output "lb_sg_id" {
  value = aws_security_group.lb_sg.id
}