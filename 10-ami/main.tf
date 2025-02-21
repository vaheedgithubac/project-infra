# ami Module calling (check once if it gives free tier image)
module "ami_al_2023_free_tier" {
  source = "git::https://github.com/vaheedgithubac/Infra//modules/ami/al_2023_free_tier"
}

# Check once the following will give free tier image
# module "ami_amazon-linux2_free_tier" {
#   source = "git::https://github.com/vaheedgithubac/Infra//modules/ami/al_2_free_tier"
# }
