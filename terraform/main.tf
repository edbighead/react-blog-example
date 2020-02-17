### ECS

resource "aws_ecs_cluster" "main" {
  name = "asem-labs-${var.env_name}"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "app-${var.env_name}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.fargate_cpu}"
  memory                   = "${var.fargate_memory}"
  container_definitions = data.template_file.service_json.rendered
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
}

resource "aws_ecs_service" "main" {
  name            = "asem-labs-${var.env_name}"
  cluster         = "${aws_ecs_cluster.main.id}"
  task_definition = "${aws_ecs_task_definition.app.arn}"
  desired_count   = "${var.app_count}"
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = ["${aws_security_group.ecs_tasks.id}"]
    subnets         = "${aws_subnet.private.*.id}"
  }

  load_balancer {
    target_group_arn = "${aws_alb_target_group.app.id}"
    container_name   = "asem-lab-web-${var.env_name}"
    container_port   = "${var.app_port}"
  }

  depends_on = [
    "aws_alb_listener.front_end",
  ]
}