resource "aws_cloud9_environment_ec2" "cloud9_ec2" {
  instance_type = "t2.micro"
  name = "${var.project_name}-cloud9-instance"
  image_id = var.cloud9_ec2_image_id

}