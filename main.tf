module "vpc" {
  source = "./vpc"
}

module "EC2" {
  source = "./web"
  sg = module.vpc.my_sg
  sn = module.vpc.my_sn
}