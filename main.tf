terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {
    organization = "EeshuCorp"

    workspaces {
      name = "Terraform_lab"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-e51cfb00-hands-on-with-terraform-on-azure"
  location = "westus"
}

# module "securestorage" {
#   source               = "app.terraform.io/EeshuCorp/securestorage/azurerm"
#   version              = "1.0.0"
#   location             = azurerm_resource_group.rg.location
#   resource_group_name  = azurerm_resource_group.rg.name
#   storage_account_name  = "rgppcc990"
# }

module "securestorage" {
  source               = "app.terraform.io/EeshuCorp/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  account_name = "rgppcc7999"
}