locals {
  requester_vpc_id   = module.vpc-org.vpc_id
  accepter_vpc_id    = data.aws_ssm_parameter.accepter_vpc_id.value

  requester_vpc_cidr = data.aws_vpc.requester.cidr_block
  accepter_vpc_cidr  = data.aws_vpc.accepter.cidr_block

  requester_route_table_ids  =  
  accepter_route_table_ids  =
}
