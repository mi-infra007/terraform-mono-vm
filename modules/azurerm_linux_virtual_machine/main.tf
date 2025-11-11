data "azurerm_subnet" "subnet_data" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip_data" {
  for_each            = var.vms
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_network_interface" "NIC" {
  for_each            = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_data[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip_data[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "VM" {
  for_each            = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = each.value.admin_username
  network_interface_ids = [
    azurerm_network_interface.NIC[each.key].id,
  ]

  disable_password_authentication = false
  admin_password                  = each.value.admin_password

  dynamic "os_disk" {
    for_each = each.value.os_disk
    content {
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
    }

  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
  tags = each.value.tags
}
