resource "aws_lb_target_group" "ecs" {
  name        = "ecs-asem-labs-${var.env_name}"
  port        = 443
  protocol    = "HTTPS"
  target_type = "instance"
}