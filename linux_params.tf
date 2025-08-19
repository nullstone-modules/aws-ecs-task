locals {
  all_kernel_cap_add = [for kc in lookup(local.capabilities, "cap_add", []) : try(kc.name, "")]
  kernel_cap_add     = length(local.all_kernel_cap_add) > 0 ? coalescelist(local.all_kernel_cap_add) : []
  kernal_cap_linux_params = length(local.kernel_cap_add) > 0 ? [{
    capabilities = {
      add  = local.kernel_cap_add
      drop = []
    }
  }] : null
}

locals {
  cap_linux_params     = [for cp in local.cap_modules : lookup(cp.outputs, "linux_parameters", [])]
  special_linux_params = local.kernal_cap_linux_params
  all_linux_params     = flatten(concat(local.cap_linux_params, local.special_linux_params))
  linux_params         = length(local.all_linux_params) > 0 ? merge([for lp in local.all_linux_params : lp]...) : null
}
