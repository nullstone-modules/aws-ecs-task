module "logs" {
  #bridgecrew:skip=CKV_TF_1: "Ensure Terraform module sources use a commit hash". We want to accept any updates to minor updates.
  source  = "nullstone-modules/logs/aws"
  version = "~>0.1.0"

  name              = local.resource_name
  tags              = local.tags
  enable_log_reader = true
  retention_in_days = 90
  kms_key_arn       = aws_kms_alias.this.arn
}

locals {
  log_configuration = {
    logDriver = "awslogs"
    options = {
      "awslogs-region"        = data.aws_region.this.region
      "awslogs-group"         = module.logs.name
      "awslogs-stream-prefix" = local.block_name
    }
  }
  log_provider = "cloudwatch"
}
