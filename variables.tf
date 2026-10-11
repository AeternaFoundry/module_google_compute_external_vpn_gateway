variable "compute_external_vpn_gateways" {
  description = <<EOT
Map of compute_external_vpn_gateways, attributes below
Required:
    - name
Optional:
    - deletion_policy
    - description
    - labels
    - project
    - redundancy_type
    - interface (block):
        - id (optional)
        - ip_address (optional)
        - ipv6_address (optional)
    - params (block):
        - resource_manager_tags (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name            = string
    deletion_policy = optional(string)
    description     = optional(string)
    labels          = optional(map(string))
    project         = optional(string)
    redundancy_type = optional(string)
    interface = optional(list(object({
      id           = optional(number)
      ip_address   = optional(string)
      ipv6_address = optional(string)
    })))
    params = optional(object({
      resource_manager_tags = optional(map(string))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

