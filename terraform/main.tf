
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

output "db_hostname" {
  value = "mock-db-service.external-systems.svc.cluster.local"
}


data "azurerm_virtual_network" "existing" {
  name                = var.vnet_name
  resource_group_name = var.network_rg_name
}

data "azurerm_subnet" "db_subnet" {
  name                 = "snet-db-private"
  virtual_network_name = data.azurerm_virtual_network.existing.name
  resource_group_name  = var.network_rg_name
}

resource "azurerm_postgresql_flexible_server" "db" {
  name                   = "psql-${var.environment}-app"
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "13"
  
  delegated_subnet_id    = data.azurerm_subnet.db_subnet.id
  private_dns_zone_id    = var.dns_zone_id

  sku_name = var.db_sku_name

  storage_mb = 32768
  
  administrator_login    = "psqladmin"
  administrator_password = var.db_password
}