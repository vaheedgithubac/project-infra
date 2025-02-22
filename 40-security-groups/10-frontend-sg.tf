module "frontend_sg" {
  source         = "git::https://github.com/vaheedgithubac/Infra.git//modules/security_group"
  vpc_id         = local.vpc_id
  sg_name        = "frontend_sg"
  sg_description = "Frontend Security Group"

  project_name = var.project_name
  env          = var.env
  common_tags  = var.common_tags
}

# Allowing traffic from web_alb --->  frontend instances
resource "aws_security_group_rule" "frontend_web_alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.web_alb_sg.sg_id
  security_group_id        = module.frontend_sg.sg_id

  depends_on = [module.web_alb_sg]
}
