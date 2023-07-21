variable "aws_region" {
  description = "AWS region where the resources will be created."
  default     = "us-east-1"
}

variable "alb_name" {
  description = "Name of the Application Load Balancer."
  #default     = "my-alb"
}

variable "alb_internal" {
  description = "Set to true if the ALB should be internal."
  default     = false
}

variable "alb_type" {
  description = "Type of the Application Load Balancer."
  default     = "application"
}

# variable "alb_subnets" {
#   description = "List of subnet IDs where the ALB should be deployed."
#   type        = list(string)
#   default     = []
# }

# variable "vpc_id" {
#   description = "ID of the VPC where the ALB and target groups will be created."
#   type        = string
#   default     = ""
# }

variable "target_group_name" {
  description = "Name of the target group."
  default     = "my-target-group"
}

variable "health_check_path" {
  description = "Path for the health check."
  default     = "/health"
}

# variable "azname" {
#   type = list(any)
#   default = [
#     "us-east-1a",
#     "us-east-1b",
#     "us-east-1c"
#   ]
# }