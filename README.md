# ECS Task

This is a Nullstone application module that provides the same workflow as other container apps in Nullstone.
However, because it is only a task, it does not create infrastructure for a long-running service.
Instead, the task is executed manually using the outputs from this module.

## When to use

ECS Task is a great choice for applications that require 2 things:
- Running jobs triggered on a schedule, from a queue, or manually
- Running on your own ECS cluster backed by EC2 instances that you manage

## Security & Compliance

Security scanning is graciously provided by [Bridgecrew](https://bridgecrew.io/).
Bridgecrew is the leading fully hosted, cloud-native solution providing continuous Terraform security and compliance.

![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-ecs-task/general)
![CIS AWS V1.3](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-ecs-task/cis_aws_13)
![PCI-DSS V3.2](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-ecs-task/pci)
![NIST-800-53](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-ecs-task/nist)
![ISO27001](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-ecs-task/iso)
![SOC2](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-ecs-task/soc2)
![HIPAA](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-ecs-task/hipaa)

## Network Access

When a task is triggered by events or through the CLI, it is placed into private subnets on the connected network.
As a result, the ECS Task can route to services on the private network.

Since it is a task, no ports are exposed privately or publicly.
It does not provide support for attaching load balancers, API Gateways, etc.

## Execution

This application module supports various capabilities to handle execution of an ECS Task.
- Trigger: Enable events to execute ECS Task (e.g. Cron Trigger, SQS Queue)
- CLI Execution: `nullstone exec` (See [`exec`](https://docs.nullstone.io/getting-started/cli/docs.html#exec) for more information)

## Logs

Logs are automatically emitted to AWS Cloudwatch Log Group: `/<task-name>`.
To access through the Nullstone CLI, use `nullstone logs` CLI command. (See [`logs`](https://docs.nullstone.io/getting-started/cli/docs.html#logs) for more information)

## Secrets

Nullstone automatically injects secrets into your ECS Task through environment variables.
(They are stored in AWS Secrets Manager and injected by AWS during launch.)
