resource "aws_ssm_parameter" "mysql_sg" {
  type  = "String"
  name  = "/${var.project_name}/${var.env}/mysql_sg"
  value = module.mysql_sg.sg_id
}
