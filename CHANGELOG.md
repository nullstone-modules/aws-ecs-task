# 0.2.6 (Jul 25, 2023)
* Switched to using the cluster from the namespace to ensure proper isolation.

# 0.2.5 (Jun 23, 2023)
* Added optional `var.command` to override image `CMD`.

# 0.2.4 (Jun 21, 2023)
* Fixed "known after apply" for event capabilities.

# 0.2.3 (Jun 21, 2023)
* Fix `launch_type` of events to `ECS`.

# 0.2.2 (Jun 21, 2023)
* Added support for events.
* Changed `task_definition_arn` to `task_definition_name` to avoid cyclical dependencies.

# 0.2.1 (Jun 20, 2023)
* Added `task_definition_arn` and `launch_type` to `app_metadata` for capabilities.

# 0.2.0 (Apr 25, 2023)
* Changed `cluster` connection to `cluster-namespace` connection.
* Dropped `service_` prefix from variables.

# 0.1.0 (Feb 28, 2023)
* Fixed generation of capability variables when the variable has no value.
* Added support for environment variable interpolation.
