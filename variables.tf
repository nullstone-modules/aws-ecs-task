variable "service_cpu" {
  type        = number
  default     = 256
  description = <<EOF
The amount of CPU units to reserve for the service.
1024 CPU units is roughly equivalent to 1 vCPU.
This means the default of 256 CPU units is roughly .25 vCPUs.
A vCPU is a virtualization of a physical CPU.
EOF
}

variable "service_memory" {
  type        = number
  default     = 512
  description = <<EOF
The amount of memory to reserve and cap the service.
If the service exceeds this amount, the service will be killed with exit code 127 representing "Out-of-memory".
Memory is measured in MiB, or megabytes.
This means the default is 512 MiB or 0.5 GiB.
EOF
}

variable "network_mode" {
  type        = string
  default     = "bridge"
  description = <<EOF
Specify the network mode to use for this task. The available options are `bridge` (default), and `awsvpc`.
`Bridge` mode is the default and creates a virtual network bridge between the host and the task container.
https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-networkmode-bridge.html
`AWSVPC` mode creates and manages an ENI (elastic network interface) for each task and each task receives its own private IP address within the VPC.
https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/networking-networkmode-awsvpc.html
EOF
}
