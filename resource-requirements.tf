locals {
  cap_res_req = lookup(local.capabilities, "resource_requirements", [])
  resource_requirements = [for r in local.cap_res_req : {
    type  = r.type
    value = tostring(r.value)
  }]
}
