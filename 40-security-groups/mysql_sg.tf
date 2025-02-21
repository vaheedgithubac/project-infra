module "mysql_sg" {
  source         = "git::https://github.com/vaheedgithubac/Infra.git//modules/security_group"
  vpc_id         = local.vpc_id
  sg_name        = "mysql_db_sg"
  sg_description = "Mysql Security Group"

  project_name = var.project_name
  env          = var.env
  common_tags  = var.common_tags
}

# bastion (public_subnet) ---> mysql (database_subnet)
resource "aws_security_group_rule" "mysql_bastion" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.mysql_sg.sg_id

  depends_on  = [ module.bastion_sg ]
}

# backend (private instances in private_subnet)  --->  mysql (database_subnet)
resource "aws_security_group_rule" "mysql_backend" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.backend_sg.sg_id
  security_group_id        = module.mysql_sg.sg_id
}
