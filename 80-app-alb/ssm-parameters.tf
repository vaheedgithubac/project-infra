resource "aws_ssm_parameter" "backend_app_target_group_arn" {
  type  = "String"
  name  = "/${var.project_name}/${var.env}/backend_app_target_group_arn"
  value =  aws_lb_target_group.backend_app_alb_target_group.arn
}
