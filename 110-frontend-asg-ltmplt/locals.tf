locals {
  sg_id                         = data.aws_ssm_parameter.frontend_sg_id.value
  public_subnet_ids             = split(",", data.aws_ssm_parameter.public_subnet_ids.value)
  resource_name                 = "${var.project_name}-${var.env}-frontend"
  frontend_web_target_group_arn = data.aws_ssm_parameter.frontend_web_target_group_arn.value
}
