module "frontend_web_asg_with_launch_template" {
  source = "git::https://github.com/vaheedgithubac/Infra//modules/asg_with_launch_template"

  # Launch template variables
  lt_type                = "frontend_web"
  image_id               = aws_ami_from_instance.frontend.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [local.sg_id]

  user_data              = file("${path.module}/frontend-dev-user-data.sh")

  # ASG variables
  asg_type            = "frontend_web"
  target_group_arns   = [local.frontend_web_target_group_arn]
  vpc_zone_identifier = [local.public_subnet_ids]
}
