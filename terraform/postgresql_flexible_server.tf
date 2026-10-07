# provider "azurerm" {
#   features {}
# }

# resource "azurerm_resource_group" "example" {
#   name     = "example-resources"
#   location = "West Europe"
# }

# resource "azurerm_virtual_network" "example" {
#   name                = "example-vn"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   address_space       = ["10.0.0.0/16"]
# }

# resource "azurerm_subnet" "example" {
#   name                 = "example-sn"
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.0.2.0/24"]
#   service_endpoint {
#     service = "Microsoft.Storage"
#   }
#   delegation {
#     name = "fs"
#     service_delegation {
#       name = "Microsoft.DBforPostgreSQL/flexibleServers"
#       actions = [
#         "Microsoft.Network/virtualNetworks/subnets/join/action",
#       ]
#     }
#   }
# }

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

resource "azurerm_postgresql_flexible_server" "example" {
  name                          = "example-psqlflexibleserver"
  resource_group_name           = azurerm_resource_group.example.name
  location                      = azurerm_resource_group.example.location
  version                       = "12"
  delegated_subnet_id           = azurerm_subnet.example.id
  private_dns_zone_id           = azurerm_private_dns_zone.example.id
  public_network_access_enabled = false
  administrator_login           = "psqladmin"
  administrator_password        = "H@Sh1CoR3!"
  zone                          = "1"

  storage_mb   = 32768
  storage_tier = "P4"

  sku_name   = "B_Standard_B1ms"
  depends_on = [azurerm_private_dns_zone_virtual_network_link.example]

}
