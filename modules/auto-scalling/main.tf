resource "aws_launch_template" "template" {
  name_prefix            = var.project_name
  image_id               = var.image_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [ var.security_group ]
  key_name = var.key_name
  user_data = base64encode(var.user_data)
  iam_instance_profile {
    name = var.iam_instance_profile
  }
}

resource "aws_autoscaling_group" "autoscale" {
  name                 = "${var.project_name}-auto-scalling"
  //availability_zones   = ["us-east-1a", "us-east-1b"]
  desired_capacity     = 3
  max_size             = 6
  min_size             = 3
  health_check_type    = "EC2"
  termination_policies = ["OldestInstance"]
  vpc_zone_identifier  = var.subnets

  target_group_arns = [ var.target_group_arn ]
  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-instance-rds"
    propagate_at_launch = true
  }
}
