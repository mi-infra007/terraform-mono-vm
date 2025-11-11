module "resource_groups" {
  source = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "virtual_networks" {
  source = "../../modules/azurerm_virtual_network"
  virtual_networks = var.virtual_networks
  depends_on = [ module.resource_groups ]
}

module "public_ip" {
  source = "../../modules/azurerm_public_ip"
  public_ip_addresses = var.public_ip_addresses
  depends_on = [ module.resource_groups ]
}

module "linux_virtual_machines" {
  source = "../../modules/azurerm_linux_virtual_machine"
  vms = var.vms
  depends_on = [ module.virtual_networks, module.public_ip ]
}