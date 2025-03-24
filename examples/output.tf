# Outputs for AD module
output "directory_id" {
  value       = module.ad.directory_id
  description = "The ID of the AD directory."
}

output "directory_name" {
  value       = module.ad.directory_name
  description = "The name of the AD directory."
}

# outputs of aws workspaces
output "id" {
  value = module.workspace.id
}

output "ip_address" {
  value = module.workspace.ip_address
}

output "computer_name" {
  value = module.workspace.computer_name
}
