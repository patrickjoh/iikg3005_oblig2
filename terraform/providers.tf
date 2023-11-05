terraform {
  required_version = ">= 0.13"  # Replace with your minimum required version

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.79.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"  # Replace with your desired version constraint
    }
  }
  backend "azurerm" {
    resource_group_name  = "pbj-rg-backend"
    storage_account_name = "sabetshhfqxgftfm"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}