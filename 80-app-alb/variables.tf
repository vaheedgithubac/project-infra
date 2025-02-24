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

##################################################################################
