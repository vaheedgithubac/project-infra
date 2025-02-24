####################################  Common  Variables  ########################

variable "project_name" { default = "expense" }
variable "env" { default = "dev" }

variable "common_tags" {
  default = {
    Project     = "expense"
    Environment = "dev"
    Terraform   = "true"
  }
}

# variable "alb_tags" {
#   type    = map()
#   default = {}
# }
####################################  SG Variables   ########################
variable "sg_name" {}

variable "sg_description" {}

variable "vpc_id" {}
