variable "resource_groups" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = map(string)
  }))
}
