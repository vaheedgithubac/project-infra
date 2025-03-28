module "backend_app_asg_with_launch_template" {
  source = "git::https://github.com/vaheedgithubac/Infra//modules/asg_with_launch_template"

  # Launch template variables
  lt_type                = "backend_app"
  image_id               = aws_ami_from_instance.backend.id
  instance_type          = var.instance_type
  key_name               = var.public_key_name
  vpc_security_group_ids = [local.sg_id]

  # ASG variables
  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"

  asg_type            = "backend_app"
  target_group_arns   = [local.backend_app_target_group_arn]
  vpc_zone_identifier = local.private_subnet_ids

  # Tags
  project_name = var.project_name
  env          = var.env
  common_tags  = var.common_tags
}


