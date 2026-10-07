data "azurerm_location" "example" {
  location = var.location
}

# data "azurerm_resource_group" "example" {
#   name = "example-resources-${var.environment}"
# }

data "azurerm_client_config" "current" {}


