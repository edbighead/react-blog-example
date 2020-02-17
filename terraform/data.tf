data "aws_availability_zones" "available" {}

data "template_file" "service_json" {
  template = "${file("task-definitions/service.json.tmpl")}"
  vars = {
    env_name  = var.env_name
    image_tag = var.image_tag
  }
}

data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
}

data "aws_route53_zone" "selected" {
  name         = "laur.work."
}