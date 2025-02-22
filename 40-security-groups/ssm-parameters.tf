# web_alb_sg_id
resource "aws_ssm_parameter" "web_alb_sg_id" {
  type  = "String"
  name  = "/${var.project_name}/${var.env}/web_alb_sg_id"
  value = module.web_alb_sg.sg_id
}

# bastion_sg_sg_id
resource "aws_ssm_parameter" "bastion_sg_sg_id" {
  type  = "String"
  name  = "/${var.project_name}/${var.env}/bastion_sg_sg_id"
  value = module.bastion_sg.sg_id
}

# frontend_sg_id
resource "aws_ssm_parameter" "frontend_sg_id" {
  type  = "String"
  name  = "/${var.project_name}/${var.env}/frontend_sg_id"
  value = module.frontend_sg.sg_id
}

# app_alb_sg_id
resource "aws_ssm_parameter" "app_alb_sg_id" {
  type  = "String"
  name  = "/${var.project_name}/${var.env}/app_alb_sg_id"
  value = module.app_alb_sg.sg_id
}

# mysql_sg_id
resource "aws_ssm_parameter" "mysql_sg_id" {
  type  = "String"
  name  = "/${var.project_name}/${var.env}/mysql_sg_id"
  value = module.mysql_sg.sg_id
}

# backend_sg_id
resource "aws_ssm_parameter" "backend_sg_id" {
  type  = "String"
  name  = "/${var.project_name}/${var.env}/backend_sg_id"
  value = module.backend_sg.sg_id
}
