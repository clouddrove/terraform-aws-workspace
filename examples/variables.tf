variable "ip_rules" {
  type = list(object({
    source      = string
    description = string
  }))
  default = [
    {
      source      = "43.224.1.228/32"
      description = "NAT"
    },
    {
      source      = "125.191.14.85/32"
      description = "NAT"
    },
  ]
  description = "List of IP rules."
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
    compute_type_name                         = "VALUE"  // The compute type. For more information, see Amazon WorkSpaces Bundles. Valid values are VALUE, STANDARD, PERFORMANCE, POWER, GRAPHICS, POWERPRO, and GRAPHICSPRO.
    user_volume_size_gib                      = 100         // The size of the user volume, in GiB.
    root_volume_size_gib                      = 175         // The size of the root volume, in GiB.
    running_mode                              = "AUTO_STOP" // The running mode of the workspace. Valid values are ALWAYS_ON and AUTO_STOP.
    running_mode_auto_stop_timeout_in_minutes = 60          // The time, in minutes, that a WorkSpace can remain idle before it is automatically stopped.
  }
}