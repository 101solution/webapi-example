storage_account_names = ["blob-sta","backup-sta"]
resource_group_name = "HAHA-HA-HAH-HAH-328"
location = "Australia Southeast"
account_replication_type = "LRS"
sta_network_rules_default_action = "Deny"
containers = {
    blob-sta   = ["blob", "temp"],
    backup-sta = ["backup", "backuptemp"]
  }
tags = {
    Company = "101 Solution"
}

sta_virtual_network_subnet_ids = [
    "/subscriptions/xxxxxxxxxxxxxxxxxxxxx/resourceGroups/HAHA-DAF-ARG-NPE-001/providers/Microsoft.Network/virtualNetworks/HAHA-DAF-ARG-NPE-001/subnets/HAHA-DAF-ARG-NPE-001-HT-10.10.10.0-solutionBI",
]
