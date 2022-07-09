locals {
  cap_mount_points = lookup(local.capabilities, "mount_points", [])

  // See https://docs.aws.amazon.com/AmazonECS/latest/developerguide/bind-mounts.html

  mount_points = [for mp in local.cap_mount_points : { sourceVolume = mp.name, containerPath = mp.path }]
  volumes      = { for mp in local.cap_mount_points : mp.name => { host_path = lookup(mp, "host_path", ""), efs_volume = lookup(mp, "efs_volume", "") } }
}
