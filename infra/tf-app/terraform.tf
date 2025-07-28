terraform {
  required_version = ">= 1.1.0"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "duan0027-githubactions-rg"
    storage_account_name = "duan0027githubactions25" # 匹配新名称
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  use_oidc = true # 启用 OIDC
}