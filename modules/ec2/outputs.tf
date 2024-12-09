output "instance_id" {
  value = aws_instance.ec2_connected_to_rds.id
}

output "ami_id" {
  value = aws_ami_from_instance.ami.id
}

output "key_name" {
  value = aws_key_pair.web_app_builder.key_name
}