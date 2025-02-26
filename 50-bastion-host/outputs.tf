output "bastion_host_public_ip" {
  value = module.bastion_ec2.ec2_instance.public_ip
}
