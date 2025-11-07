variable "region" {}

variable "requester_project_name" {}
variable "accepter_project_name" {}

variable "requester_project_env" {}
variable "accepter_project_env" {}

variable "requester_route_table_ids" { type = list }
variable "accepter_route_table_ids" { type = list }

variable "common_tags" {
  default = {
    Project     = "org"
    Environment = "dev"
    Terraform   = "true"
  }
}
