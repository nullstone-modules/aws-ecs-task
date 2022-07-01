data "ns_connection" "cluster" {
  name     = "cluster"
  contract = "cluster/aws/ecs:ec2"
}

data "ns_connection" "network" {
  name     = "network"
  contract = "network/aws/vpc"
  via      = data.ns_connection.cluster.name
}

locals {
  vpc_id         = data.ns_connection.network.outputs.vpc_id
  private_cidrs  = data.ns_connection.network.outputs.private_cidrs
  public_cidrs   = data.ns_connection.network.outputs.public_cidrs
  cluster_name   = data.ns_connection.cluster.outputs.cluster_name
  deployers_name = data.ns_connection.cluster.outputs.deployers_name
}

data "aws_ecs_cluster" "cluster" {
  cluster_name = local.cluster_name
}
