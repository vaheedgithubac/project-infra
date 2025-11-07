# Fetch the accepter VPC ID
data "aws_ssm_parameter" "accepter_vpc_id" {
  name = "/${var.accepter_project_name}/${var.accepter_project_env}/vpc_id"
}


