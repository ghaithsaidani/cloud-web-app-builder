resource "aws_db_instance" "rds" {
  engine            = "mysql"
  engine_version    = "8.0.39"
  db_name           = var.db_name
  identifier        = var.db_name
  instance_class    = "db.t3.micro"
  allocated_storage = 30
  username          = var.db_username
  password          = var.db_password
}
