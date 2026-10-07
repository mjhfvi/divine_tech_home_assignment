environment = "dev"
location = "westus2" # see `Notes` for issues
acr_name = "divineacr"
azurerm_container_app_cpu = 0.25
azurerm_container_app_memory = "0.5Gi"
azurerm_key_vault_value = "AI-API-KEY"
alert_email = "alert@example.com"
lifecycle_prevent_destroy = "true" # when `true` this will clean all resources on terraform destroy, set to true to prevent accidental deletion of resources



## Notes ##
# Resource `azurerm_container_app_environment` only avilibale in locations:
# 'northcentralusstage,westus2,southeastasia,swedencentral,canadacentral,westeurope,northeurope,eastus,eastus2,eastasia,australiaeast,germanywestcentral,japaneast,uksouth,westus,centralus,northcentralus,southcentralus,koreacentral,brazilsouth,westus3,francecentral,southafricanorth,norwayeast,switzerlandnorth,uaenorth,canadaeast,westcentralus,ukwest,centralindia,germanynorth,newzealandnorth,austriaeast,mexicocentral,uaecentral,chilecentral,koreasouth,jioindiacentral,belgiumcentral,japanwest,australiasoutheast,francesouth,jioindiawest,spaincentral,italynorth,polandcentral,malaysiawest,indonesiacentral,southindia'
