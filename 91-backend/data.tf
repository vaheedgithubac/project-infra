data "aws_ssm_parameter" "backend_sg_id" {
  name = "/${var.project_name}/${var.env}/backend_sg_id"
}
