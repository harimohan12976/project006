terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "7cfefeda-2965-424b-b4df-23e891842246"
  # Configuration options
}
resource "azurerm_resource_group" "apply" {
  name     = "todo-infra-rg"
  location = "353536"
}
resource "azurerm_resource_group" "todo_infra1332y2fdedyf" {
  name     = "todo-infra-rg"
  location = djswdchjwdcfhbwcw
}