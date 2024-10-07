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
  description = "Terraform current module repo"
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
  default     = ""
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

variable "compute_type_name" {
  default     = "VALUE"
  type        = string
  description = "The compute type. For more information, see Amazon WorkSpaces Bundles. Valid values are VALUE, STANDARD, PERFORMANCE, POWER, GRAPHICS, POWERPRO and GRAPHICSPRO."
}

variable "user_volume_size_gib" {
  default     = 10
  type        = number
  description = "The size of the root volume."
}

variable "root_volume_size_gib" {
  default     = 80
  type        = number
  description = "The size of the root volume."
}

variable "running_mode" {
  default     = "AUTO_STOP"
  type        = string
  description = "The running mode. For more information, see Manage the WorkSpace Running Mode. Valid values are AUTO_STOP and ALWAYS_ON."
}

variable "running_mode_auto_stop_timeout_in_minutes" {
  default     = 60
  type        = number
  description = "The time after a user logs off when WorkSpaces are automatically stopped. Configured in 60-minute intervals."
}
