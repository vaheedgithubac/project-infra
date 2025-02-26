resource "aws_ssm_parameter" "bastion_host_public_ip" {
  type  = "String"
  name  = "/${var.project_name}/${var.env}/bastion_host_public_ip"
  value = module.bastion_ec2.ec2_instance.public_ip
}

