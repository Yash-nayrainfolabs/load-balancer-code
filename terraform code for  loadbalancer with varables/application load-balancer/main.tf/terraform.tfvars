aws_region     = "us-east-1"
alb_name       = "test-alb"
alb_internal   = false
alb_type       = "application"
alb_subnets    = ["subnet-12345678", "subnet-87654321"]
#vpc_id         = "vpc-abcdefgh"
target_group_name = "test-target-group"
health_check_path = "/health"