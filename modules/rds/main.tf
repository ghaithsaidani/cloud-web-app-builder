resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "${var.project_name}-rds-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "rds" {
  engine            = "mysql"
  engine_version    = "8.0.39"
  db_name           = var.db_name
  identifier        = var.db_identifier
  instance_class    = "db.t3.micro"
  allocated_storage = 30
  username          = var.db_username
  password          = var.db_password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [ var.security_group_id ]
  skip_final_snapshot = true
  //multi_az = true
}
