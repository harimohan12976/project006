resource "azurerm_public_ip" "backend_public_ip" {
  name                = var.backend_public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"
}
resource "azurerm_public_ip" "frontend_public_ip" {
  name                = var.public_ip_frontend_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"
  sku                 = "Standard"
}

