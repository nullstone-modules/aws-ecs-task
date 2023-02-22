provider "ns" {
  capability_id = 436
  alias         = "cap_436"
}

module "cap_436" {
  source  = "api.nullstone.io/nullstone/aws-redis-access/any"

  app_metadata = local.app_metadata
  
  providers = {
    ns = ns.cap_436
  }
}
provider "ns" {
  capability_id = 441
  alias         = "cap_441"
}

module "cap_441" {
  source  = "api.nullstone.io/nullstone/aws-ecs-docker-sock/any"

  app_metadata = local.app_metadata
  
  providers = {
    ns = ns.cap_441
  }
}
provider "ns" {
  capability_id = 435
  alias         = "cap_435"
}

module "cap_435" {
  source  = "api.nullstone.io/nullstone/aws-postgres-access/any"

  app_metadata = local.app_metadata
  database_name = jsondecode("\"enigma\"")
  
  providers = {
    ns = ns.cap_435
  }
}

module "caps" {
  source  = "nullstone-modules/cap-merge/ns"
  modules = local.modules
}

locals {
  modules      = [module.cap_436, module.cap_441, module.cap_435]
  capabilities = module.caps.outputs

  cap_modules = [
    {
      id         = 436
      namespace  = ""
      env_prefix = ""
      outputs    = module.cap_436
    }
    , {
      id         = 441
      namespace  = ""
      env_prefix = ""
      outputs    = module.cap_441
    }
    , {
      id         = 435
      namespace  = ""
      env_prefix = ""
      outputs    = module.cap_435
    }
  ]
}

locals {
  cap_env_vars = merge([
    for mod in local.cap_modules : {
      for item in lookup(mod.outputs, "env", []) : "${mod.env_prefix}${item.name}" => item.value
    }
  ]...)

  cap_secrets = merge([
    for mod in local.cap_modules : {
      for item in lookup(mod.outputs, "secrets", []) : "${mod.env_prefix}${item.name}" => item.value
    }
  ]...)
}
