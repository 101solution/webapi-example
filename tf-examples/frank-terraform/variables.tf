# Input variables
variable "sta_network_rules_default_action" {
}

variable "sta_virtual_network_subnet_ids" {
}
variable "storage_account_names" {
  type    = list(string)
  default = ["racwainssta1","racwainssta2","racwainssta3"]
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

variable "network_rules_default_action" {
  description = "Default action for network rules (allow or deny)"
  type        = string
  default     = "Deny"
}

variable "virtual_network_subnet_ids" {
  description = "List of virtual network subnet IDs to allow/deny access"
  type        = list(string)
  default     = []
}

variable "containers" {
  type = map(list(string))
  default = {
    racwainssta1 = ["container1", "container2"],
    racwainssta2 = ["container3", "container4"]
  }
}