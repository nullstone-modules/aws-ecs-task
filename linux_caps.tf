locals {
  kernel_cap_add = [for kc in lookup(local.capabilities, "cap_add", []) : kc]
}
