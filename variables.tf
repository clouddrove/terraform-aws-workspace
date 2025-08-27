#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "managedby" {
  type        = string
  default     = "anmol@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove' or 'AnmolNagpal'."
}

variable "attributes" {
  type        = list(any)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-aws-workspace"
  description = "Terraform current module repo."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to control the WorkSpaces creation."
}

#variables : AWS WorkSpaces Terraform modules
variable "bundle_id" {
  default     = "wsb-bh8rsxt14"
  type        = string
  description = "The ID of the bundle for the WorkSpace."
}

variable "workspace_username" {
  default     = "Administrator"
  type        = string
  description = "The user name of the user for the WorkSpace. This user name must exist in the directory for the WorkSpace."
}

variable "directory_id" {
  default     = "d-00000000" # valid placeholder
  type        = string
  description = "The ID of the directory for the WorkSpace."
}

variable "volume_encryption_key" {
  default     = null
  type        = string
  description = "The symmetric AWS KMS customer master key (CMK) used to encrypt data stored on your WorkSpace. Amazon WorkSpaces does not support asymmetric CMKs."
}

variable "root_volume_encryption_enabled" {
  default     = false
  type        = bool
  description = "Indicates whether the data stored on the root volume is encrypted."
}

variable "user_volume_encryption_enabled" {
  default     = false
  type        = bool
  description = "Indicates whether the data stored on the user volume is encrypted."
}

variable "workspace_properties" {
  description = "Workspace properties configuration."
  type = object({
    compute_type_name                         = string
    user_volume_size_gib                      = number
    root_volume_size_gib                      = number
    running_mode                              = string
    running_mode_auto_stop_timeout_in_minutes = number
  })
  default = {
    compute_type_name                         = "VALUE"     // The compute type. For more information, see Amazon WorkSpaces Bundles. Valid values are VALUE, STANDARD, PERFORMANCE, POWER, GRAPHICS, POWERPRO, and GRAPHICSPRO.
    user_volume_size_gib                      = 10          // The minimum size of the user volume, in GiB.
    root_volume_size_gib                      = 80          // The minimum size of the root volume, in GiB.
    running_mode                              = "AUTO_STOP" // The running mode of the workspace. Valid values are ALWAYS_ON and AUTO_STOP.
    running_mode_auto_stop_timeout_in_minutes = 60          // The time, in minutes, that a WorkSpace can remain idle before it is automatically stopped.
  }
}
