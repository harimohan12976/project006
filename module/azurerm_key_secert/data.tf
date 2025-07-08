data "azurerm_key_vault" "khiroda_kv_vault_frontend" {
  name                = var.key_vault_name_frontend
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault" "khiroda_kv_vault_backend" {
  name                = var.key_vault_name_backend
  resource_group_name = var.resource_group_name
}