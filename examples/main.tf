# -----------------------------------------------------------------------------
# Local Values
# Define local values for repeated values.
# -----------------------------------------------------------------------------
locals {
  name        = "app"
  region      = "us-east-1"
  environment = "test"
  label_order = ["environment", "name"]
}
# -----------------------------------------------------------------------------
# AWS Provider Configuration
# Configure the AWS provider to interact with AWS resources.
# -----------------------------------------------------------------------------
provider "aws" {
  region = local.region
}

# -----------------------------------------------------------------------------
# VPC Module
# Create a Virtual Private Cloud (VPC) to host your AWS resources.
# -----------------------------------------------------------------------------
module "vpc" {
  source  = "clouddrove/vpc/aws"
  version = "2.0.0"

  name        = "${local.name}-vpc"
  environment = local.environment
  label_order = local.label_order

  cidr_block = "10.0.0.0/16"
}

# -----------------------------------------------------------------------------
# Subnets Module
# Create subnets within the VPC to organize and isolate resources.
# -----------------------------------------------------------------------------
module "subnets" {
  source  = "clouddrove/subnet/aws"
  version = "2.0.0"

  name        = "${local.name}-subnet"
  environment = local.environment
  label_order = local.label_order

  availability_zones = ["${local.region}a", "${local.region}b"]
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
module "ad" {
  source  = "clouddrove/active-directory/aws"
  version = "1.0.3"

  name           = "${local.name}-ad"
  environment    = local.environment
  label_order    = local.label_order
  directory_type = "MicrosoftAD"
  directory_size = "Small"
  directory_name = "ad.example.com"
  subnet_ids     = module.subnets.public_subnet_id
  vpc_settings   = { vpc_id : module.vpc.vpc_id, subnet_ids : join(",", module.subnets.public_subnet_id) }
  ad_password    = "xyz123@abc"
  ip_rules       = var.ip_rules

  # Additional features
  # Additional optional parameters for more features
  edition     = "Standard" # Can be "Standard" or "Enterprise"
  short_name  = "clouddrove"
  description = "Microsoft AD for Clouddrove"
  enable_sso  = false
  # Set to true to enable Single Sign-On (SSO) for Microsoft AD
  # Uncomment the following line to set an alias for the Microsoft AD
  # alias       = "clouddrove-ad"
}

# -----------------------------------------------------------------------------
# Workspace Module
# Set up AWS WorkSpaces within the specified directory.
# -----------------------------------------------------------------------------
module "workspace" {
  source = "./../"

  name        = "${local.name}-workspace"
  environment = local.environment
  label_order = local.label_order
  enabled     = false // first run terraform apply and then create custom user names in workspace manually and then enable it.
  # Username for the WorkSpace, must be created manually in AWS Console and should exist in Active Directory.
  workspace_username = "admin-user"
  bundle_id          = "wsb-xnp4cfzht"
  directory_id       = module.ad.directory_id
}
