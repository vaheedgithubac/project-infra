locals {
  database_subnet_ids = split(",", data.aws_ssm_parameter.database_subnet_ids.value)
  availability_zones  = split(",", data.aws_ssm_parameter.availability_zones.value)
  mysql_sg_id         = data.aws_ssm_parameter.mysql_sg_id.value
}
