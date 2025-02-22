module "backend_sg" {
  source         = "git::https://github.com/vaheedgithubac/Infra.git//modules/security_group"
  vpc_id         = local.vpc_id
  sg_name        = "backend_sg"
  sg_description = "Backend Security Group"

  project_name = var.project_name
  env          = var.env
  common_tags  = var.common_tags
}
