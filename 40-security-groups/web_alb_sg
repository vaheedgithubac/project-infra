module "web_alb_sg" {
  source         = "git::https://github.com/vaheedgithubac/Infra.git//modules/security_group"
  vpc_id         = local.vpc_id
  sg_name        = "web_alb_sg"
  sg_description = "Web ALB Security Group"

  project_name = var.project_name
  env          = var.env
  common_tags  = var.common_tags
}
