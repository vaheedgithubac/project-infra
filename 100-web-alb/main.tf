# Create Public Web ALB
module "alb" {
  source = "git::https://github.com/vaheedgithubac/Infra//modules/alb"

  internal              = false
  alb_sg_ids            = [local.web_alb_sg_id]
  subnets               = local.public_subnet_ids  
  #vpc_id                = local.vpc_id

  project_name = var.project_name
  env          = var.env
  common_tags  = var.common_tags
}

# create target group
resource "aws_lb_target_group" "frontend_web_target_group" {
  name = "${local.resource_name}-frontend-web-tg"    # max 32 characters long
  # target_type = "ip"
  port     = 80
  protocol = "HTTP"
  vpc_id   = local.vpc_id

health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 60
    matcher             = "200-299"
    path                = "/"        # "/health"
    port                = 80
    protocol            = "HTTP"
    timeout             = 30
  }

# health_check {   AzeezSalu
#   enabled             = true
#   interval            = 300
#   path                = "/"
#   timeout             = 60
#   matcher             = 200
#   healthy_threshold   = 5
#   unhealthy_threshold = 5
# }

lifecycle {
  create_before_destroy = true
  }
}

# create Listener for ALB
resource "aws_lb_listener" "http" {
  load_balancer_arn = module.alb.alb_arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<center><h1>Hello, I am from frontend WEB ALB</h1></center>"
      status_code  = "200"
    }
  }
}

# create a listener on port 80 with redirect action to 443 (http ---> https)
# resource "aws_lb_listener" "alb_http_listener" {
#   load_balancer_arn = aws_lb.application_load_balancer.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type = "redirect"

#     redirect {
#       port        = 443
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
#   }
# }

# Create a Listener rule for ALB
resource "aws_lb_listener_rule" "frontend" {
  listener_arn = aws_lb_listener.http.arn #local.app_alb_listener_arn
  priority     = 100                      # low priority will be evaluated first

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend_web_target_group.arn   #aws_lb_target_group.backend.arn
  }

  condition {
    path_pattern {
      values = ["/*"] # This matches all paths
    }
  }

  #   condition {
  #     host_header {
  #       values = ["${var.backend_tags.Component}.app-${var.environment}.${var.zone_name}"]  # backend.app-dev.daws81s.online
  #     }
  #   }
}
