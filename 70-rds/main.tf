module "rds" {
  source = "git::https://github.com/vaheedgithubac/Infra.git//modules/rds"

  database_subnet_ids = local.database_subnet_ids       # For subnet group creation
  
  engine                 = "mysql"
  engine_version         = "8.0.40"
  multi_az               = false
  identifier             = "expense-db-instance"
  username               = "admin"
  password               = "admin123"
  instance_class         = "db.t3.micro"
  allocated_storage      = 8
  db_subnet_group_name   = "mysql_db_subnet_group_1"
  vpc_security_group_ids = [local.mysql_sg_id] #var.vpc_security_group_ids
  availability_zone      = local.availability_zones[0]
  db_name                = null
  skip_final_snapshot    = true
  deletion_protection    = false

  project_name = var.project_name
  env          = var.env
  common_tags  = var.common_tags

}
