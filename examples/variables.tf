variable "ip_rules" {
  type = list(object({
    source      = string
    description = string
  }))
  default = [
    {
      source      = "150.107.189.227/32" // change it according to your requirement
      description = "IP Whitelisting"
    }
  ]
  description = "List of IP rules."
}
