module "bastion_sg" {
  source         = "git::https://github.com/vaheedgithubac/Infra.git//modules/security_group"
  vpc_id         = local.vpc_id
  sg_name        = "bastion_sg"
  sg_description = "Bastion Security Group"

  project_name = var.project_name
  env          = var.env
  common_tags  = var.common_tags
}

# Bastion host should be accessed from office n/w   0.0.0.0/0 ---> bastion
resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastion_sg.sg_id
}
