terraform {
  required_version = ">= 1.4.4"
  required_providers {
    azurerm = {
      source   = "hashicorp/azurerm"
      version  = "3.59.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "xxxxx-xxx-xxx-xxx-328"
    storage_account_name = "xxxxxxxxxxxtfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider azurerm {
  skip_provider_registration = true
  features {}
}

module "storage_account" {
  source  = "./modules/storage-account"

  # Input variables for the storage account module
  storage_account_names            = var.storage_account_names
  containers                       = var.containers
  location                         = var.location
  resource_group_name              = var.resource_group_name
  sta_network_rules_default_action = var.sta_network_rules_default_action
  sta_virtual_network_subnet_ids   = var.sta_virtual_network_subnet_ids
}

# Loop over the storage_account_names list
resource "null_resource" "storage_accounts" {
  count = length(var.storage_account_names)

  triggers = {
    storage_account_name = var.storage_account_names[count.index]
  }

  # This null_resource block is empty since the resource is just used as a way to trigger the module creation
}
