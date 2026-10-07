# `azurerm_location` resource
output "azurerm_location_name" {
  description = "The name of the location."
  value       = data.azurerm_location.example.display_name
}

output "azurerm_location_id" {
  description = "The ID of the location."
  value       = data.azurerm_location.example.id
}

# `azurerm_resource_group` resource
output "azurerm_resource_group_id" {
  description = "The Azure Resource Manager ID of the resource group."
  value       = azurerm_resource_group.example.id
}

output "azurerm_resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.example.name
}

output "azurerm_resource_group_location" {
  description = "The regional location of the resource group."
  value       = azurerm_resource_group.example.location
}


## kubernetes_cluster
# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.example.kube_config[0].client_certificate
#   sensitive = true
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.example.kube_config_raw

#   sensitive = true
# }

###
