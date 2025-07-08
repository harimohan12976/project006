# Backend
data "azurerm_subnet" "backend" {
  name                 = var.backend_subnet
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_public_ip" "backend_public_ip" {
  name                = var.backend_public_ip_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault" "khiroda_kv_vault_backend" {
  name                = var.key_vault_name_backend
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "backend_secret_username" {
  name         = "khiroda-vm-username"
  key_vault_id = data.azurerm_key_vault.khiroda_kv_vault_backend.id
}

data "azurerm_key_vault_secret" "backend_secret_password" {
  name         = "khiroda-vm-password"
  key_vault_id = data.azurerm_key_vault.khiroda_kv_vault_backend.id
}

resource "azurerm_network_interface" "backend_nic" {
  name                = var.backend_network_interface_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.backend.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.backend_public_ip.id
  }
}

resource "azurerm_virtual_machine" "backend_vm" {
  name                  = var.backend_vm_name
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.backend_nic.id]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "backend-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "backend-host"
    admin_username = data.azurerm_key_vault_secret.frontend_secret_username.value
    admin_password = data.azurerm_key_vault_secret.frontend_secret_password.value
  }
  
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

# Frontend
data "azurerm_subnet" "frontend" {
  name                 = var.frontend_subnet
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_public_ip" "frontend_public_ip" {
  name                = var.frontend_public_ip_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault" "khiroda_kv_vault_frontend" {
  name                = var.key_vault_name_frontend
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "frontend_secret_username" {
  name         = "khiroda-vm-username"
  key_vault_id = data.azurerm_key_vault.khiroda_kv_vault_frontend.id
}

data "azurerm_key_vault_secret" "frontend_secret_password" {
  name         = "khiroda-vm-password"
  key_vault_id = data.azurerm_key_vault.khiroda_kv_vault_frontend.id
}

resource "azurerm_network_interface" "frontend_nic" {
  name                = var.frontend_network_interface_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.frontend_ip_configuration_name
    subnet_id                     = data.azurerm_subnet.frontend.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.frontend_public_ip.id
  }
}

resource "azurerm_virtual_machine" "frontend_vm" {
  name                  = var.frontend_vm_name
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.frontend_nic.id]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "frontend-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "frontend-host"
    admin_username = data.azurerm_key_vault_secret.frontend_secret_username.value
    admin_password = data.azurerm_key_vault_secret.frontend_secret_password.value
  }


  os_profile_linux_config {
    disable_password_authentication = false
  }
}
