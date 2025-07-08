variable "key_vault_name_frontend" {}
variable "resource_group_name" {}
variable "key_vault_name_backend" {}
variable "key_vault_name_frontend_secret_username" {
  description = "Name of the frontend secret username in Key Vault"
}
variable "key_vault_name_frontend_secret_username_value" {
  description = "Value of the frontend secret username in Key Vault"
}
variable "key_vault_name_frontend_secret_password" {
  description = "Name of the frontend secret password in Key Vault"
}
variable "key_vault_name_frontend_secret_password_value" {
  description = "Value of the frontend secret password in Key Vault"
}
variable "key_vault_name_backend_secret_username" {
  description = "Name of the backend secret username in Key Vault"
}
variable "key_vault_name_backend_secret_username_value" {
  description = "Value of the backend secret username in Key Vault"
}
variable "key_vault_name_backend_secret_password" {
  description = "Name of the backend secret password in Key Vault"
}
variable "key_vault_name_backend_secret_password_value" {
  description = "Value of the backend secret password in Key Vault"
}