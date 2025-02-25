module "backend_app_asg_with_launch_template" {
  source = ""

  # Launch template variables
  lt_type                = "backend_app"
  image_id               = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [local.vpc_security_group_id]

  # ASG variables
  asg_type            = "backend_app"
  target_group_arns   = [local.backend_app_target_group_arn]
  vpc_zone_identifier = [local.private_subnet_ids]
}
