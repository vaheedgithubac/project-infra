module "vpc-peering" {
  source = "git::https://github.com/vaheedgithubac/Infra//modules/vpc_peering"   # Give the path to VPC MODULE accordingly

  region                       =  var.region
  requester_vpc_id             =  local.requester_vpc_id                       # "/org/dev/vpc_id"
  accepter_vpc_id              =  local.accepter_vpc_id                        # "/expense/dev/vpc_id"      
}
