############### If you want 1 az, 1 public subnet, 1 private subnet and 1 database subnet ########################
 module "vpc-org" {
   source = "git::https://github.com/vaheedgithubac/Infra//modules/vpc"          # Give the path to VPC MODULE accordingly

   # All the counts should be same 
   azs_count             = 1
   public_subnet_count   = 1
   private_subnet_count  = 1
   database_subnet_count = 1

   vpc_cidr             = "10.200.0.0/16"
   public_subnet_cidr   = ["10.200.1.0/24"]
   private_subnet_cidr  = ["10.200.11.0/24"]
   database_subnet_cidr = ["10.200.31.0/24"]

   project_name =  var.project_name    # "org"
   env          =  var.env             # "dev"
   common_tags  =  var.common_tags
 }

module "vpc-peering" {
  source = "git::https://github.com/vaheedgithubac/Infra//modules/vpc_peering"   # Give the path to VPC MODULE accordingly

  region                       =  var.region
  requester_vpc_id             =  var.requester_vpc_id
  accepter_vpc_id              =  var.accepter_vpc_id
  peering_dest_cidr_requester  =  "10.200.0.0/16         # var.peering_dest_cidr_requester
  peering_dest_cidr_accepter   =  var.peering_dest_cidr_accepter
}
############################################################################################################################
# VPC-MODULE Calling
# module "vpc" {
#  source = "git::https://github.com/vaheedgithubac/Infra//modules/vpc" # Give the path to VPC MODULE accordingly

  # All the counts should be same 
#  azs_count             = 2
#  public_subnet_count   = 2
#  private_subnet_count  = 2
#  database_subnet_count = 2

#  vpc_cidr             = "10.100.0.0/16"
#  public_subnet_cidr   = ["10.100.1.0/24", "10.100.2.0/24"]
#  private_subnet_cidr  = ["10.100.11.0/24", "10.100.12.0/24"]
#  database_subnet_cidr = ["10.100.31.0/24", "10.100.32.0/24"]

#  project_name = var.project_name
#  env          = var.env
#  common_tags  = var.common_tags
#}


