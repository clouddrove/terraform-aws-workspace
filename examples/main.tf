# -----------------------------------------------------------------------------
# AWS Provider Configuration
# Configure the AWS provider to interact with AWS resources.
# -----------------------------------------------------------------------------
provider "aws" {
  region = "eu-west-1"
}

# -----------------------------------------------------------------------------
# VPC Module
# Create a Virtual Private Cloud (VPC) to host your AWS resources.
# -----------------------------------------------------------------------------
module "vpc" {
  source  = "clouddrove/vpc/aws"
  version = "2.0.0"

  name        = "vpc"
  environment = "test-01"
  label_order = ["name", "environment"]

  cidr_block = "10.20.0.0/16"
}

# -----------------------------------------------------------------------------
# Subnets Module
# Create subnets within the VPC to organize and isolate resources.
# -----------------------------------------------------------------------------
module "subnets" {
  source  = "clouddrove/subnet/aws"
  version = "2.0.0"

  name        = "subnets"
  environment = "test-01"
  label_order = ["name", "environment"]

  availability_zones = ["eu-west-1a", "eu-west-1b"]
  vpc_id             = module.vpc.vpc_id
  type               = "public"
  igw_id             = module.vpc.igw_id
  cidr_block         = module.vpc.vpc_cidr_block
  ipv6_cidr_block    = module.vpc.ipv6_cidr_block
}

# -----------------------------------------------------------------------------
# Microsoft Active Directory Module
# Set up a Microsoft Active Directory within the specified VPC.
# -----------------------------------------------------------------------------
module "microsoft-ad" {
  source = "git::https://github.com/clouddrove/terraform-aws-active-directory.git?ref=feature/ad-modules"

  environment = "test"
  name        = "ad-clouddrove"
  label_order = ["name", "environment"]

  directory_type = "MicrosoftAD"
  directory_size = "Small"
  directory_name = "test.ld.clouddrove.ca"
  subnet_ids     = module.subnets.public_subnet_id
  vpc_settings   = { vpc_id : module.vpc.vpc_id, subnet_ids : join(",", module.subnets.public_subnet_id) }
  ad_password    = "xyz123@abc"
  ip_rules       = var.ip_rules

  # Additional features
  edition     = "Standard" # Can be "Standard" or "Enterprise"
  short_name  = "clouddrove"
  description = "Microsoft AD for Clouddrove"
  enable_sso  = false
  alias       = "clouddrove-ad"
}

# -----------------------------------------------------------------------------
# Workspace Module
# Set up AWS WorkSpaces within the specified directory.
# -----------------------------------------------------------------------------
module "workspace" {
  source = "./../"

  name        = "workspace"
  environment = "test-01"
  enabled     = true

  workspace_properties = var.workspace_properties
  workspace_username   = "manishshah"
  label_order          = ["name", "environment"]
  bundle_id            = "wsb-g5rbnq51n"
  directory_id         = module.microsoft-ad.directory_id
}