# aws-ecs-task

This is a Nullstone application module that provides the same workflow as other container apps in Nullstone.
However, because it is only a task, it does not create infrastructure for a long-running service.
Instead, the task is executed manually using the outputs from this module.

## Push

This module enables support for automated artifact pushes.
This process utilizes credentials from `image_pusher` output to push to the ECR repository. 

## Deploy

This module enables support for automated deploys.
This process utilizes credentials from `deployer` output to perform commands against AWS:
- create deployment record in Nullstone
- Register new ECS Task Definition
- Deregister old ECS Task Definition

## Service Name

By contract, an `app:container/aws/ecs:*` module must contain `service_name` output.
Since there is no service in this module, this output is set to `""` to signal to consumers (e.g. Nullstone CLI) that there is no service.

## Load Balancers/Service Port

Since this module is a task and has no long-running service, it does not support attaching load balancers or any other ingress capabilities.
Additionally, this module provides no configuration for `service_port` since there is no long-running communication.
