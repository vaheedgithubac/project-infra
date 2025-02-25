locals {
  sg_id                        = data.aws_ssm_parameter.backend_sg_id.value
  private_subnet_ids           = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
  resource_name                = "${var.project_name}-${var.environment}-backend"
  backend_app_target_group_arn = data.aws_ssm_parameter.backend_app_target_group_arn.value
}
