locals {
  // secret_refs is prepared in the form [{ name = "", valueFrom = "<arn>" }, ...] for injection into ECS services
  secret_refs = [for key in local.secret_keys : { name = key, valueFrom = aws_secretsmanager_secret.app_secret[key].arn }]
  all_secret_refs = concat(local.secret_refs, local.existing_secret_refs)
}

resource "aws_secretsmanager_secret" "app_secret" {
  # bridgecrew:skip=CKV2_AWS_57: "Ensure Secrets Manager secrets should have automatic rotation enabled". We cannot automatically rotate user secrets.
  for_each = local.secret_keys

  name_prefix = "${local.block_name}/${each.value}/"
  tags        = local.tags
  kms_key_id  = aws_kms_alias.this.arn

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_secretsmanager_secret_version" "app_secret" {
  for_each = local.secret_keys

  secret_id     = aws_secretsmanager_secret.app_secret[each.value].id
  secret_string = local.all_secrets[each.value]

  lifecycle {
    create_before_destroy = true
  }
}
