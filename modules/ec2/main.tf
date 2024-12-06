resource "aws_key_pair" "web_app_builder" {
  key_name = "${var.project_name}-key"
  public_key = file("~/.ssh/web_app_builder.pub")
}

resource "aws_instance" "ec2_integrated_sql" {
  ami = var.ami
  instance_type = "t2.micro"
  key_name = aws_key_pair.web_app_builder.key_name

  subnet_id = var.subnet_id
  vpc_security_group_ids = [ var.security_group_id ]

  user_data = var.user_data

  tags = {
    Name = "${var.project_name}-instance"
  }
}