variable "resource_groups" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = map(string)
  }))
}

variable "virtual_networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))
    tags = map(string)
  }))
}

variable "public_ip_addresses" {
  
}

variable "vms" {
  
}