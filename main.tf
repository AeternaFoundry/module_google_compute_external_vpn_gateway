resource "google_compute_external_vpn_gateway" "compute_external_vpn_gateways" {
  for_each = var.compute_external_vpn_gateways

  name            = each.value.name
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  labels          = each.value.labels
  project         = each.value.project
  redundancy_type = each.value.redundancy_type

  dynamic "interface" {
    for_each = each.value.interface != null ? each.value.interface : []
    content {
      id           = interface.value.id
      ip_address   = interface.value.ip_address
      ipv6_address = interface.value.ipv6_address
    }
  }

  dynamic "params" {
    for_each = each.value.params != null ? [each.value.params] : []
    content {
      resource_manager_tags = params.value.resource_manager_tags
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

