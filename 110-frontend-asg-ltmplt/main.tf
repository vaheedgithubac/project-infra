module "frontend_web_asg_with_launch_template" {
  source = "git::https://github.com/vaheedgithubac/Infra//modules/asg_with_launch_template"

  # Launch template variables
  lt_type                = "frontend_web"
  image_id               = var.image_id
  instance_type          = var.instance_type
  key_name               = var.public_key_name
  vpc_security_group_ids = [local.sg_id]

  associate_public_ip_address = true

  user_data              = filebase64("${path.module}/frontend-dev-user-data.sh")

  # ASG variables
  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"

  asg_type            = "frontend_web"
  target_group_arns   = [local.frontend_web_target_group_arn]
  vpc_zone_identifier = local.public_subnet_ids

  project_name = var.project_name
  env          = var.env
  common_tags  = var.common_tags
}
