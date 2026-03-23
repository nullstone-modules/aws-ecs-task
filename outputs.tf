output "region" {
  value       = data.aws_region.this.region
  description = "string ||| The region where the ECS task resides."
}

output "service_name" {
  value       = ""
  description = "string ||| This is an empty string because there is no service for a task."
}

output "main_container_name" {
  value       = local.container_definition.name
  description = "string ||| The name of the container definition for the main service container"
}

output "task_arn" {
  value       = aws_ecs_task_definition.this.arn
  description = "string ||| The AWS ARN of the app task definition."
}

output "launch_type" {
  value       = "EC2"
  description = "string ||| The ECS launch type used to execute commands."
}

output "app_security_group_id" {
  value       = aws_security_group.this.id
  description = "string ||| The ID of the security group attached to the app."
}

output "image_pusher" {
  value       = local.pusher
  description = "object({ role_arn: string, session_duration: number }) ||| An AWS role with explicit privilege to push images."
}

output "deployer" {
  value       = local.deployer
  description = "object({ role_arn: string, session_duration: number, name: string, access_key: string, secret_key: string}) ||| An AWS IAM identity with explicit privilege to deploy ECS services."
}

output "log_provider" {
  value       = local.log_provider
  description = "string ||| The name of the log provider containing application logs."
}

output "log_group_name" {
  value       = module.logs.name
  description = "string ||| The name of the cloudwatch log group containing application logs."
}

output "log_reader" {
  value       = merge(module.logs.reader, { session_duration : 3600 })
  description = "object({ role_arn: string, session_duration: number }) ||| An AWS Role with explicit privilege to read logs from Cloudwatch."
  sensitive   = true
}

output "metrics_provider" {
  value       = "cloudwatch"
  description = "string ||| "
}

output "metrics_reader" {
  value       = merge(module.logs.reader, { session_duration : 3600 })
  description = "object({ role_arn: string, session_duration: number }) ||| An AWS Role with explicit privilege to read metrics from Cloudwatch."
  sensitive   = true
}

output "metrics_mappings" {
  value = local.metrics_mappings
}

output "image_repo_name" {
  value       = try(aws_ecr_repository.this[0].name, "")
  description = "string ||| "
}

output "image_repo_url" {
  value       = try(aws_ecr_repository.this[0].repository_url, "")
  description = "string ||| "
}

output "private_urls" {
  value       = local.private_urls
  description = "list(string) ||| A list of URLs only accessible inside the network"
}

output "public_urls" {
  value       = local.public_urls
  description = "list(string) ||| A list of URLs accessible to the public"
}

output "private_hosts" {
  value       = local.private_hosts
  description = "list(string) ||| A list of Hostnames only accessible inside the network"
}

output "public_hosts" {
  value       = local.public_hosts
  description = "list(string) ||| A list of Hostnames accessible to the public"
}
