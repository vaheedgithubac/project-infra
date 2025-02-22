module "backend_sg" {
  source         = "git::https://github.com/vaheedgithubac/Infra.git//modules/security_group"
  vpc_id         = local.vpc_id
  sg_name        = "backend_sg"
  sg_description = "Backend Security Group"

  project_name = var.project_name
  env          = var.env
  common_tags  = var.common_tags
}

# Allow traffic from app_alb ---> backend
resource "aws_security_group_rule" "backend_app_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.app_alb_sg.sg_id
  security_group_id = module.backend_sg.sg_id

  depends_on = [ module.app_alb_sg ]
}
