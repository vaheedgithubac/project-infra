data "aws_ssm_parameter" "requester_vpc_id" {
  name = "/${requester_project_name}/${requester_project_env}/vpc_id"
}

data "aws_ssm_parameter" "accepter_vpc_id" {
  name = "/${accepter_project_name}/${accepter_project_env}/vpc_id"
}

data "aws_ssm_parameter" "accepter_vpc_cidr" {
  name = "/${accepter_project_name}/${accepter_project_env}/vpc_cidr"
}
