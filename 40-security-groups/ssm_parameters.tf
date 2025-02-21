resource "aws_ssm_parameter" "mysql_sg_id" {
  type  = "String"
  name  = "/${var.project_name}/${var.env}/mysql_sg_id"
  value = module.mysql_sg.sg_id
}
