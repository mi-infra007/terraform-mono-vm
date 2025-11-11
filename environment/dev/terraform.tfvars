resource_groups = {
  key1 = {
    name       = "rg-dev-001"
    location   = "Central India"
    managed_by = "team-a"
    tags = {
      environment = "dev"
      project     = "project-x"
    }
  }

  key2 = {
    name     = "rg-dev-002"
    location = "Central India"
    tags = {
      environment = "dev-1"
      project     = "project-x"
    }
  }
}


virtual_networks = {
  vnet1 = {
    name                = "vnet-dev-001"
    location            = "Central India"
    resource_group_name = "rg-dev-001"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      subnet1 = {
        name             = "frontend"
        address_prefixes = ["10.0.0.0/24"]
      }
      subnet2 = {
        name             = "backend"
        address_prefixes = ["10.0.1.0/24"]
      }
    }

    tags = {
      environment = "dev"
      project     = "project-x"
    }

  }

  vnet2 = {
    name                = "vnet-dev-002"
    location            = "Central India"
    resource_group_name = "rg-dev-001"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      subnet1 = {
        name             = "subnet1"
        address_prefixes = ["10.0.0.0/24"]
      }
    }

    tags = {
      environment = "dev"
      project     = "project-x"
    }

  }


}

public_ip_addresses = {
  pip1 = {
    name                = "frontend-pip"
    resource_group_name = "rg-dev-001"
    location            = "Central India"
    allocation_method   = "Static"

    tags = {
      environment = "dev"
      project     = "project-x"
    }
  }
  pip2 = {
    name                = "backend-pip"
    resource_group_name = "rg-dev-001"
    location            = "Central India"
    allocation_method   = "Static"

    tags = {
      environment = "dev"
      project     = "project-x"
    }
  }
}


vms = {
  vm1 = {
    subnet_name          = "frontend"
    virtual_network_name = "vnet-dev-001"
    public_ip_name       = "frontend-pip"
    nic_name             = "nic-dev-001"
    location             = "Central India"
    resource_group_name  = "rg-dev-001"
    vm_name              = "vm-dev-001"
    vm_size              = "Standard B1s"
    admin_username       = "testuser"
    admin_password       = "P@ssword1234"
    os_disk = {
      osdisk1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    tags = {
      environment = "dev"
      project     = "project-x"
    }
  }

  vm2 = {
    subnet_name          = "backend"
    virtual_network_name = "vnet-dev-001"
    public_ip_name       = "backend-pip"
    nic_name             = "nic-dev-002"
    location             = "Central India"
    resource_group_name  = "rg-dev-001"
    vm_name              = "vm-dev-001"
    vm_size              = "Standard B1s"
    admin_username       = "testuser"
    admin_password       = "P@ssword1234"
    os_disk = {
      osdisk1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    tags = {
      environment = "dev"
      project     = "project-x"
    }
  }
}


