# Managed By : CloudDrove
# Description : This Script is used to create AWS Workspaces.
# Copyright @ CloudDrove. All Right Reserved.

#Module      : Label
#Description : This terraform module is designed to generate consistent label names and tags
#              for resources. You can use terraform-labels to implement a strict naming
#              convention.
module "labels" {
  source  = "clouddrove/labels/aws"
  version = "1.3.0"

  name        = var.name
  environment = var.environment
  attributes  = var.attributes
  repository  = var.repository
  managedby   = var.managedby
  label_order = var.label_order
}

data "aws_workspaces_bundle" "bundle" {
  bundle_id = var.bundle_id
}

#Module      : AWS Workspaces
#Description : Terraform module to create AWS WorkSpaces.
#tfsec:ignore:aws-workspaces-enable-disk-encryption
#tfsec:ignore:aws-workspaces-enable-disk-encryption
resource "aws_workspaces_workspace" "workspace_ad" {
  count = var.enabled ? 1 : 0

  directory_id = var.directory_id
  bundle_id    = data.aws_workspaces_bundle.bundle.id
  user_name    = var.workspace_username

  root_volume_encryption_enabled = var.root_volume_encryption_enabled
  user_volume_encryption_enabled = var.user_volume_encryption_enabled
  volume_encryption_key          = var.volume_encryption_key

  workspace_properties {
    compute_type_name                         = var.compute_type_name
    user_volume_size_gib                      = var.user_volume_size_gib
    root_volume_size_gib                      = var.root_volume_size_gib
    running_mode                              = var.running_mode
    running_mode_auto_stop_timeout_in_minutes = var.running_mode_auto_stop_timeout_in_minutes
  }

  tags = module.labels.tags
}