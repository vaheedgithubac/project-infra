resource "aws_ssm_parameter" "mysql_sg_id" {
  type  = "String"
  name  = "/${var.project_name}/${var.env}/mysql_sg_id"
  value = module.mysql_sg.sg_id
}

resource "aws_ssm_parameter" "bastion_sg_sg_id" {
  type  = "String"
  name  = "/${var.project_name}/${var.env}/bastion_sg_sg_id"
  value = module.bastion_sg.sg_id
}
