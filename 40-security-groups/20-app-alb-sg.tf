module "app_alb_sg" {
  source         = "git::https://github.com/vaheedgithubac/Infra.git//modules/security_group"
  vpc_id         = local.vpc_id
  sg_name        = "app_alb_sg"
  sg_description = "App ALB Security Group"

  project_name = var.project_name
  env          = var.env
  common_tags  = var.common_tags
}

# Allowing traffic from forntend ---> app_alb
resource "aws_security_group_rule" "app_alb_frontend" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.frontend_sg.sg_id
  security_group_id = module.app_alb_sg.sg_id
}
