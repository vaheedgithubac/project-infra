locals {
  resource_name     = "${var.project_name}-${var.env}"
  vpc_id            = data.aws_ssm_parameter.vpc_id.value
  web_alb_sg_id     = data.aws_ssm_parameter.web_alb_sg_id.value
  public_subnet_ids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)
}
