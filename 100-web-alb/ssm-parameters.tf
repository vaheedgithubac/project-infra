resource "aws_ssm_parameter" "front_web_target_group_arn" {
  type  = "String"
  name  = "/${var.project_name}/${var.env}/front_web_target_group_arn"
  value =  aws_lb_target_group.frontend_web_target_group.arn     
}
