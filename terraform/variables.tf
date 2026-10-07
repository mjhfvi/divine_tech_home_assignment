variable "lifecycle_prevent_destroy" {
  description = "prevent destruction of azure resources"
  type        = bool
  nullable    = false
  default     = "false"
}

variable "location" {
  description = "azure resource location"
  type        = string
  nullable    = false
  default     = "israelcentral"
}

variable "environment" {
  description = "environment prod/dev"
  type        = string
  nullable    = false
  default     = "dev"
}

variable "azurerm_container_app_cpu" {
  description = "azurerm container app cpu"
  type        = string
  nullable    = false
  default     = "0.5"
}

variable "azurerm_container_app_memory" {
  description = "azurerm container app memory"
  type        = string
  nullable    = false
  default     = "1.0"
}

variable "acr_name" {
  description = "acr name"
  type        = string
  nullable    = false
  default     = "divinehomeassignmentacr"
}

variable "alert_email" {
  description = "alert email"
  type        = string
  nullable    = false
  default     = "alert@example.com"
}

variable "azurerm_key_vault_value" {
  description = "azurerm key vault value"
  type        = string
  nullable    = false
  default     = "AI-API-KEY"
}