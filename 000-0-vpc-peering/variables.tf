variable "project_name" { default = "org" }
variable "env" { default = "dev" }

variable "common_tags" {
  default = {
    Project     = "org"
    Environment = "dev"
    Terraform   = "true"
  }
}
