terraform {
  required_version = "~> 1.5"  # update

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.96.0"  # update
    }
  }

  backend "azurerm" {
    resource_group_name  = "duan0027-githubactions-rg"
    storage_account_name = "duan0027githubactions25"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc             = true  # add
  }
}

provider "azurerm" {
  features {}
  use_oidc = true  # add
}