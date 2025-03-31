locals {
  kernel_cap_add = coalescelist([for kc in lookup(local.capabilities, "cap_add", []) : try(kc.name, "")])
}
