# 0.3.21 (Aug 18, 2025)
* Added support for `linuxParameters` in capabilities.

# 0.3.20 (Jul 21, 2025)
* Upgraded all terraform providers to latest.

# 0.3.19 (Jul 09, 2025)
* Added `nullstone.io/version` tag to task definition.

# 0.3.18 (Mar 31, 2025)
* Fixed `launch_type` injected into capabilities.

# 0.3.17 (Mar 31, 2025)
* Fixed contract for linux kernel capabilities from Nullstone capabilities.

# 0.3.16 (Mar 31, 2025)
* Fixed configuration of linux parameters.

# 0.3.15 (Mar 19, 2025)
* Added support for linux kernel capabilities from Nullstone capabilities.
* Added support for ulimits from Nullstone capabilities.

# 0.3.14 (Mar 10, 2025)
* Emitting `subnet_ids` in `app_metadata` as comma-delimited string.

# 0.3.13 (Mar 10, 2025)
* Added `subnet_ids` to capabilities variables `app_metadata`.

# 0.3.12 (Jan 22, 2025)
* When an app secret is removed, it is immediately deleted from AWS secrets manager.

# 0.3.11 (Apr 29, 2024)
* Fixed launching of tasks using `nullstone exec`.

# 0.3.10 (Feb 14, 2024)
* Added GPU support.

# 0.3.9 (Feb 10, 2024)
* Added permissions to list image tags in image repository.

# 0.3.8 (Nov 09, 2023)
* Update lockfile.

# 0.3.6 (Nov 09, 2023)
* Update lockfile.

# 0.3.5 (Nov 02, 2023)
* Fix typo with encryption key.

# 0.3.4 (Nov 02, 2023)
* Enable `force_delete` on image repository to prevent destroy failure.

# 0.3.3 (Oct 04, 2023)
* Added support for secrets interpolation.

# 0.3.0 (Aug 08, 2023)
* Added compliance scanning.
* Updated `README.md` with application management info.
* Fix compliance issues.

# 0.2.7 (Aug 03, 2023)
* Fixed `event` capabilities attachment.

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
