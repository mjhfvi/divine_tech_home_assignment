# resource "azurerm_key_vault" "example" {
#   name                       = "example-key-vault-${var.environment}"
#   location                   = azurerm_resource_group.example.location
#   resource_group_name        = azurerm_resource_group.example.name
#   rbac_authorization_enabled = false
#   tenant_id                  = data.azurerm_client_config.current.tenant_id
#   sku_name                   = "standard"
#   soft_delete_retention_days = 7

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = [
#       "Create",
#       "Get",
#       "List",
#       "Update",
#     ]

#     secret_permissions = [
#       "Set",
#       "Get",
#       "Delete",
#       "Purge",
#       "Recover",
#       "List",
#     ]
#   }
# }

# resource "azurerm_key_vault_secret" "example" {
#   name         = "AI-API-KEY"
#   value        = var.azurerm_key_vault_value
#   key_vault_id = azurerm_key_vault.example.id
# }
