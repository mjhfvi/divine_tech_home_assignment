resource "azurerm_servicebus_namespace" "example" {
  name                = "divine-tfex-servicebus-namespace-${var.environment}-01"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"

  tags = {
    source = "terraform"
  }
}

resource "azurerm_servicebus_queue" "example" {
  name         = "divine-tfex-servicebus-queue-${var.environment}-01"
  namespace_id = azurerm_servicebus_namespace.example.id
  partitioning_enabled = true
}
