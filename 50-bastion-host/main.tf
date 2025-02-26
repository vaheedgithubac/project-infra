module "bastion_ec2" {
  source = "git::https://github.com/vaheedgithubac/Infra.git//modules/ec2"

  ami_id                      = var.ami_id
  instance_type               = var.instance_type
  public_key_name             = var.public_key_name
  sg_id                       = [ local.sg_id ]
  subnet_id                   =  local.public_subnet_ids[0]    # "subnet-088e8443a70102e2a" #1a
  associate_public_ip_address = true
  what_type_instance          = var.what_type_instance

  user_data                   = file("${path.module}/mysql_client_8.sh")

  # is_nat_instance             = var.is_nat_instance  # creates NAT instance if true
 

  project_name                = var.project_name
  env                         = var.env
  common_tags                 = var.common_tags
}
