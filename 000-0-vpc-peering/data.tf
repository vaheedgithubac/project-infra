# Fetch the accepter VPC ID
data "aws_ssm_parameter" "accepter_vpc_id" {
  name = "/${var.accepter_project_name}/${var.accepter_project_env}/vpc_id"
}

###############################################################################
# DATA SOURCES: Fetch VPC Details (like cidr_block and many more)
###############################################################################

data "aws_vpc" "requester" {
  id = local.requester_vpc_id
}

data "aws_vpc" "accepter" {
  id = local.accepter_vpc_id
}

###############################################################################
# DATA SOURCES: Fetch all route tables in a given VPC
###############################################################################

data "aws_route_tables" "requester" {
  # vpc_id = var.requester_vpc_id
  filter {
    name   = "vpc-id"
    values = [var.requester_vpc_id]
  }
}

data "aws_route_tables" "accepter" {
  # vpc_id = var.accepter_vpc_id
  filter {
    name   = "vpc-id"
    values = [var.accepter_vpc_id]
  }
}


