data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.env}/vpc_id"
}

data "aws_ssm_parameter" "database_subnet_ids" {
  name = "/${var.project_name}/${var.env}/database_subnet_ids"
}

data "aws_ssm_parameter" "availability_zones" {
  name = "/${var.project_name}/${var.env}/availability_zones"
}

### Sgs
data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.project_name}/${var.env}/mysql_sg_id"
}
