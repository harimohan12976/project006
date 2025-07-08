#Azure Resource Group Module
module"azurerm_resource_group" {
  source = "../module/azurerm_resource_group"

  resource_group_name     = "khiroda-todo-rg-new"
  resource_group_location = "centralindia"
}

#Azure Virtual Network Module
module"azurem_virtual_net" {
  source = "../module/azurem_virtual_net"
  depends_on = [ module.azurerm_resource_group ]

  virtual_network_name     = "khiroda-todo-vnet-new"
  resource_group_location  = "centralindia"
  resource_group_name      = "khiroda-todo-rg-new"
}

#Azure Subnet Module
module"azurem_subnet" { 
  source = "../module/azurem_subnet"
    depends_on = [ module.azurem_virtual_net ]

    frontend_subnet         = "frontend-subnet-new"
    backend_subnet          = "backend-subnet-new"
    resource_group_name     = "khiroda-todo-rg-new"
    virtual_network_name    = "khiroda-todo-vnet-new"
}
#Azure SQL Server Module
module"azurem_sql_server" { 
    source = "../module/azurem_sql_server"
    depends_on = [ module.azurem_subnet ]
    
    sql_server_name          = "khiroda-todo-sql-server-new"
    resource_group_name      = "khiroda-todo-rg-new"
    resource_group_location  ="centralindia"
    administrator_login      = "khiroda_admin"
    administrator_login_password = "9800118299@Hari"
    }

#Azure SQL Database Module
module"azurem_sql_database" { 
    source = "../module/azurem_sql_database"
    depends_on = [ module.azurem_sql_server ]

    database_name            = "khiroda-todo-db-new"
    sql_server_name          = "khiroda-todo-sql-server-new"
    resource_group_name      = "khiroda-todo-rg-new"
}

#Azure Public IP Module
module"azurem_public_ip" {  
    source = "../module/azurem_public_ip"
    depends_on = [ module.azurem_sql_database ]
    
    backend_public_ip_name           = "backend-public-ip"
    resource_group_name      = "khiroda-todo-rg-new"
    resource_group_location  = "centralindia"
    public_ip_frontend_name  = "frontend-public-ip"
}


#Azure Virtual Machine Module
module"azurerm_virtual_machine" { 
    source = "../module/azurerm_virtual_machine"
    depends_on = [ module.azurem_public_ip , module.azurerm_key_vault, module.azurerm_key_secert ] 
    

    backend_subnet                = "backend-subnet-new"
    virtual_network_name          = "khiroda-todo-vnet-new"
    resource_group_name           = "khiroda-todo-rg-new"
    backend_public_ip_name        = "backend-public-ip"
    backend_network_interface_name = "backend-nic"
    resource_group_location       = "centralindia"
    ip_configuration_name         = "ipconfig1"
    backend_vm_name               = "backend-vm"
    frontend_subnet              = "frontend-subnet-new"
    frontend_public_ip_name      = "frontend-public-ip"   
    frontend_network_interface_name = "frontend-nic"
    frontend_ip_configuration_name = "frontend-ipconfig"
    frontend_vm_name             = "frontend-vm"
    key_vault_name_backend       = "khiroda-kv-backend"
    backend_secret_name_username = "khiroda-vm-username"   
    backend_secret_name_password = "9800118299@Hari#Pwd"
    key_vault_name_frontend      = "khiroda-kv-frontend"
    frontend_secret_name_username = "khiroda-vm-username"
    frontend_secret_name_password = "8158835581@priti#Hari"
}
# Azure Key Vault Module
module"azurerm_key_vault" {   
  source = "../module/azurerm_key_vault"
  # depends_on = [ module.azurerm_virtual_machine ]    
  key_vault_name_frontend           = "khiroda-kv-frontend"
  resource_group_location   = "centralindia"    
  resource_group_name       = "khiroda-todo-rg-new"
  key_vault_name_backend            = "khiroda-kv-backend"
}

# Azure Key Vault Secret Module
module"azurerm_key_secert" {  
  source = "../module/azurerm_key_secert"
  depends_on = [ module.azurerm_key_vault ]

  key_vault_name_frontend = "khiroda-kv-frontend"
  resource_group_name     = "khiroda-todo-rg-new"
  key_vault_name_backend  = "khiroda-kv-backend"
  key_vault_name_frontend_secret_username = "frontend-username"
  key_vault_name_frontend_secret_username_value = "frontenduser"  
  key_vault_name_frontend_secret_password = "frontend-password"
  key_vault_name_frontend_secret_password_value = "9564772843@Priti"
  key_vault_name_backend_secret_username = "backend-username"
  key_vault_name_backend_secret_username_value = "backenduser"
  key_vault_name_backend_secret_password = "backend-password"
  key_vault_name_backend_secret_password_value = "9800118299@Hari#Pwd"
  }









