# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources-${var.environment}-01"
  location = var.location

}
