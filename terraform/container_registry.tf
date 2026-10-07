resource "azurerm_container_registry" "acr" {
  name                = "DivineHomeAssignmentContainerRegistry${var.environment}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Premium"
  admin_enabled       = false

  georeplications {
    location                        = "East US"
    global_endpoint_routing_enabled = true
    zone_redundancy_enabled         = true
    tags                            = {}
  }

  georeplications {
    location                        = "North Europe"
    global_endpoint_routing_enabled = true
    zone_redundancy_enabled         = true
    tags                            = {}
  }
}
