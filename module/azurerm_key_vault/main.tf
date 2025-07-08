data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "khiroda_kv_vault_frontend" {
  name                        = var.key_vault_name_frontend
  location                    = var.resource_group_location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"
  public_network_access_enabled = true
  enable_rbac_authorization     = true
}

resource "azurerm_key_vault" "khiroda_kv_vault_backend" {
  name                        = var.key_vault_name_backend
  location                    = var.resource_group_location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"
  public_network_access_enabled = true
  enable_rbac_authorization     = true
}