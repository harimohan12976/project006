resource "azurerm_subnet" "frontend" {
  name                 = var.frontend_subnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "backend" {
  name                 = var.backend_subnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.2.0/24"]
}