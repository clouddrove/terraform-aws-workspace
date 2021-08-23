provider "aws" {
  region = "eu-west-1"

}
module "vpc" {
  source  = "clouddrove/vpc/aws"
  version = "0.15.0"

  name        = "vpc"
  environment = "test"
  label_order = ["name", "environment"]

  cidr_block = "10.0.0.0/16"
}

module "subnets" {
  source             = "clouddrove/subnet/aws"
  version            = "0.15.0"
  name               = "subnets"
  environment        = "test"
  label_order        = ["name", "environment"]
  availability_zones = ["eu-west-1a", "eu-west-1b"]
  vpc_id             = module.vpc.vpc_id
  type               = "public"
  igw_id             = module.vpc.igw_id
  cidr_block         = module.vpc.vpc_cidr_block
  ipv6_cidr_block    = module.vpc.ipv6_cidr_block
}

module "ad" {
  source      = "clouddrove/active-directory/aws"
  name        = "ad"
  environment = "test"
  enabled     = true

  subnet_ids                          = module.subnets.public_subnet_id
  vpc_id                              = module.vpc.vpc_id
  ad_name                             = "ad.clouddrove.com"
  label_order                         = ["name", "environment"]
  ad_password                         = "xyz123@abc"
  ip_whitelist                        = ["51.79.69.69/32", "212.121.146.139/32"]
  enable_internet_access              = true
  user_enabled_as_local_administrator = true
}


module "workspace" {
  source      = "./../"
  name        = "workspace"
  environment = "test"
  enabled     = true

  workspace_username = "Administrator"
  label_order        = ["name", "environment"]
  bundle_id          = "wsb-8pmj7b7pq"
  directory_id       = module.ad.directory_id

}