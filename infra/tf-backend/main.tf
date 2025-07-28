terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
  use_oidc = true # 启用 OIDC 认证，支持 GitHub Actions
}

resource "azurerm_resource_group" "rg" {
  name     = "duan0027-githubactions-rg"
  location = "Canada Central"
}

resource "azurerm_storage_account" "sa" {
  name                     = "duan0027githubactions25" # 新名称，确保唯一
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "container_name" {
  value = azurerm_storage_container.tfstate.name
}

# 可选：仅本地测试需要
output "arm_access_key" {
  value     = azurerm_storage_account.sa.primary_access_key
  sensitive = true
}