data "aws_ssm_parameter" "frontend_sg_id" {
  name = "/${var.project_name}/${var.env}/frontend_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.env}/public_subnet_ids"
  # depends_on = [ module.vpc ]
}

data "aws_ssm_parameter" "private_key" {
  name            = "/frontend/ssh/private-key"
  with_decryption = true
  depends_on      = [ aws_ssm_parameter.private_key ]
}

data "aws_ssm_parameter" "frontend_app_target_group_arn" {
  name = "/${var.project_name}/${var.env}/frontend_app_target_group_arn"
}
