# Target group
resource "aws_lb_target_group" "tg" {
  name = "${var.project_name}-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id = var.instance_id
  port = 80
}

# ALB
resource "aws_lb" "lb" {
  name = "${var.project_name}-load-balancer"
  internal = false
  load_balancer_type = "application"
  security_groups = [ var.security_group ]
  subnets = var.subnets
}

# Listener
resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}


