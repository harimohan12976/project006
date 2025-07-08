resource "azurerm_key_vault_secret" "backend_secret_username" {
  name         = "khiroda-vm-username"
  value        = var.key_vault_name_backend_secret_username_value
  key_vault_id = data.azurerm_key_vault.khiroda_kv_vault_backend.id
}
resource "azurerm_key_vault_secret" "backend_secret_password" {
  name         = "khiroda-vm-password"
  value        = var.key_vault_name_backend_secret_password_value
  key_vault_id = data.azurerm_key_vault.khiroda_kv_vault_backend.id
}
resource "azurerm_key_vault_secret" "frontend_secret_username" {
  name         = "khiroda-vm-username"
  value        = var.key_vault_name_frontend_secret_username_value
  key_vault_id = data.azurerm_key_vault.khiroda_kv_vault_frontend.id
}
resource "azurerm_key_vault_secret" "frontend_secret_password" {
  name         = "khiroda-vm-password"
  value        = var.key_vault_name_frontend_secret_password_value
  key_vault_id = data.azurerm_key_vault.khiroda_kv_vault_frontend.id
}