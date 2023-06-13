locals {
  storage_list = [
    {
      name = "STA1"
      containers = [
        { name = "sta1_ct1" },
        { name = "sta1_ct2" },
        { name = "sta1_ct3" }
      ]
    },
    {
      name = "STA2"
      containers = [
        { name = "sta2_ct1" },
        { name = "sta2_ct2" },
        { name = "sta2_ct3" }
      ]
    }
  ]

  out_list = flatten([
    for sta_key, sta in local.storage_list : [
      for ct_key,  ct in sta.containers : {
        sta_key = sta_key
        ct_key  = ct_key
        sta_name  = sta.name
        ct_name  = ct.name
      }
    ]
  ])
}

output "name" {
  value = local.out_list
}