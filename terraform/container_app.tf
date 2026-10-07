resource "azurerm_log_analytics_workspace" "example" {
  name                = "example-log-analytics-workspace-${var.environment}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "example" {
  name                       = "example-container-app-env-${var.environment}"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  logs_destination           = "log-analytics"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
}

# Create Container App with custom scaling based on Service Bus
resource "azurerm_container_app" "example" {
  name                         = "example-container-app-${var.environment}"
  container_app_environment_id = azurerm_container_app_environment.example.id
  resource_group_name          = azurerm_resource_group.example.name
  revision_mode                = "Single"

  template {
      min_replicas = 1
      max_replicas = 5

  container {
        name   = "divine-ai-container"
        image  = "divinehomeassignmentcontainerregistrydev.azurecr.io/divine-ai:latest" # "mcr.microsoft.com/azuredocs/divine-ai:latest"
        cpu    = 0.5
        memory = "1Gi"
      }

# KEDA: Scale based on Service Bus queue length
    custom_scale_rule {
      name             = "servicebus-scaler"
      custom_rule_type = "azure-servicebus"
      metadata = {
        queueName       = azurerm_servicebus_queue.example.name
        messageCount    = "10"
        namespace       = azurerm_servicebus_namespace.example.name
      }

  authentication {
          secret_name       = "servicebus-connection"   # Secret name for connection string
          trigger_parameter = "connection"              # Trigger parameter for scaling
        }
      }

# KEDA: Scale based on CPU usage
    custom_scale_rule {
      name             = "cpu-scaler"
      custom_rule_type = "cpu"
      metadata = {
        type  = "Utilization"
        value = "70"
      }
    }
  }

  # secret {
  #     name  = "servicebus-connection"
  #     value = azurerm_servicebus_namespace_authorization_rule.example.primary_connection_string
  #   }

  identity {
      type = "SystemAssigned"
    }

  ingress {
      external_enabled = true
      target_port      = 80
      transport        = "http"

  traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}