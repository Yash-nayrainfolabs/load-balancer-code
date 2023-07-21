resource "aws_security_group" "alb_sg" {
  name_prefix = "alb-sg"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = var.alb_internal
  load_balancer_type = var.alb_type
  subnets            = [aws_default_subnet.default-subnet-us-east-1a.id, aws_default_subnet.default-subnet-us-east1b.id]
  security_groups    = [aws_security_group.alb_sg.id]

  tags = {
    Name = var.alb_name
  }
}

#creating targer group load_balancer
resource "aws_lb_target_group" "alb_target_group" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id

  health_check {
    path                = var.health_check_path
    protocol            = "HTTP"
    interval            = 15
    timeout             = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Create targer group attachment
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.test-instance.id
  port             = 80
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

# default vpc configurartion
resource "aws_default_vpc" "default" {
  tags = {
    Name = "default VPC"
  }
}

# default subner configuration
resource "aws_default_subnet" "default-subnet-us-east-1a" {
  availability_zone = "us-east-1a"
  tags = {
    Name = "Default subnet for us-east-1a"
  }
}

resource "aws_default_subnet" "default-subnet-us-east1b" {
  availability_zone = "us-east-1b"
  tags = {
    Name = "Default subnet for us-east-1b"
  }
}
 
