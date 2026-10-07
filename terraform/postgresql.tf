# resource "azurerm_private_dns_zone" "example" {
#   name                = "example.postgres.database.azure.com"
#   resource_group_name = azurerm_resource_group.example.name
# }

# resource "azurerm_private_dns_zone_virtual_network_link" "example" {
#   name                = "exampleVnetZone.com"
#   private_dns_zone_id = azurerm_private_dns_zone.example.id
#   virtual_network_id  = azurerm_virtual_network.example.id
#   depends_on          = [azurerm_subnet.example]
# }

# resource "azurerm_postgresql_flexible_server" "example" {
#   name                          = "divine-example-psqlflexibleserver-${var.environment}-01"
#   resource_group_name           = azurerm_resource_group.example.name
#   location                      = azurerm_resource_group.example.location
#   version                       = "12"
#   delegated_subnet_id           = azurerm_subnet.example.id
#   private_dns_zone_id           = azurerm_private_dns_zone.example.id
#   public_network_access_enabled = false
#   administrator_login           = "psqladmin"
#   administrator_password        = "H@Sh1CoR3!"
#   zone                          = "1"

#   storage_mb   = 32768
#   storage_tier = "P4"

#   sku_name   = "B_Standard_B1ms"
#   depends_on = [azurerm_private_dns_zone_virtual_network_link.example]
# }
