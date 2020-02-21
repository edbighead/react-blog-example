# variable "env_name" {
#   type        = string
#   description = "environment name"
# }

# variable "image_tag" {
#   type        = string
#   description = "image tag"
# }

# variable "az_count" {
#   description = "Number of AZs to cover in a given AWS region"
#   default     = "2"
# }

# variable "app_port" {
#   description = "Port exposed by the docker image to redirect traffic to"
#   default     = 80
# }

# variable "app_count" {
#   description = "Number of docker containers to run"
#   default     = 2
# }

# variable "fargate_cpu" {
#   description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
#   default     = "256"
# }

# variable "fargate_memory" {
#   description = "Fargate instance memory to provision (in MiB)"
#   default     = "512"
# }

# variable "vpc_cidr" {
#   description = "VPC CIDR block"
# }

# variable "dns_record" {
#   description = "Alternative DNS record"
# }