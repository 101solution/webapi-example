variable "containers" {
  type = map(list(string))
}

variable "sta_network_rules_default_action" {
  description = "Default action for network rules (allow or deny)"
  type        = string
  default     = "Deny"
}

variable "sta_virtual_network_subnet_ids" {
  description = "List of virtual network subnet IDs to allow/deny access"
  type        = list(string)
  default     = []
}


variable "storage_account_names" {
  type = list(string)
}


variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Location of the Azure Resource Group"
  type        = string
}

variable "account_replication_type" {
  description = "Replication type of the Azure Storage Account"
  type        = string
  default     = "LRS"
}

variable "tags" {
  description = "Tags of the Azure resources"
  type        = map(string)
  default     = {}
}

resource "azurerm_storage_account" "storage" {
  count                    = length(var.storage_account_names)
  name                     = var.storage_account_names[count.index]
  tags                     = var.tags
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_container" "container" {
  count                 = length(var.storage_account_names)
  name                  = "${var.containers[var.storage_account_names[count.index]][count.index]}"
  storage_account_name  = azurerm_storage_account.storage[count.index].name
  container_access_type = "private"
}

resource "azurerm_storage_account_network_rules" "network_rule" {
  count                      = length(var.storage_account_names)
  storage_account_id         = azurerm_storage_account.storage[count.index].id
  default_action             = var.sta_network_rules_default_action
  virtual_network_subnet_ids = var.sta_virtual_network_subnet_ids
  bypass                     = []
  ip_rules                   = []
}
