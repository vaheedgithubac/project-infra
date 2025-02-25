data "aws_ssm_parameter" "bastion_sg_sg_id" {
  name  = "/${var.project_name}/${var.env}/bastion_sg_sg_id"
}
