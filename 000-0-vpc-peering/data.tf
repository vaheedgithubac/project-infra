data "aws_ssm_parameter" "accepter_vpc_id" {
  name = "/expense/dev/vpc_id"
  # name = "/${var.project_name}/${var.env}/vpc_id"
}

data "aws_ssm_parameter" "accepter_vpc_cidr" {
  name = "/expense/dev/vpc_cidr"
  # name = "/${var.project_name}/${var.env}/vpc_id"
}
