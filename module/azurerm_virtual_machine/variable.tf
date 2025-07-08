variable "backend_subnet" {}
variable "virtual_network_name" {}
variable "resource_group_name" {}
variable "backend_public_ip_name" {}
variable "backend_network_interface_name" {}
variable "resource_group_location" {}
variable "ip_configuration_name" {}
variable "backend_vm_name" {}

variable "frontend_subnet" {
  description = "Name of the frontend subnet"
}
variable  "frontend_public_ip_name" {
  description = "Name of the frontend public IP"
}
variable "frontend_network_interface_name" {
  description = "Name of the frontend network interface"
}
variable "frontend_ip_configuration_name" {
  description = "Name of the frontend IP configuration"
}
variable "frontend_vm_name" {
  description = "Name of the frontend virtual machine"
}
variable "key_vault_name_backend" {
  description = "Admin username for the frontend VM"
}
variable  "backend_secret_name_username" {
  description = "Name of the backend secret in Key Vault"
}
variable "backend_secret_name_password" {
  description = "Name of the backend secret in Key Vault"
}
variable "key_vault_name_frontend" {
  description = "Name of the Key Vault for the frontend VM"
  
}
variable  "frontend_secret_name_username" {
  description = "Name of the frontend secret in Key Vault"
}
variable "frontend_secret_name_password" {
  description = "Name of the frontend secret in Key Vault"
}