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
