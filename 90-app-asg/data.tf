data "aws_ssm_parameter" "backend_sg_id" {
  name = "/${var.project_name}/${var.env}/backend_sg_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.env}/private_subnet_ids"
}

data "aws_ssm_parameter" "backend_app_target_group_arn" {
  name = "/${var.project_name}/${var.env}/backend_app_target_group_arn"
}
