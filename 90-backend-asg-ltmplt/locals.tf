locals {
  sg_id                        = data.aws_ssm_parameter.backend_sg_id.value
  private_subnet_ids           = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
  resource_name                = "${var.project_name}-${var.env}-backend"
  backend_app_target_group_arn = data.aws_ssm_parameter.backend_app_target_group_arn.value
  bastion_host_public_ip       = data.aws_ssm_parameter.bastion_host_public_ip.value"
}
