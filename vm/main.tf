resource "azurerm_resource_group" "rg-jenkins" {
  name = var.rg_name
  location = var.rg_location
  tags = {
    "grupo" = "grupo6"
    "diplomado" = "AnaSanMartin"
  }
}

resource "azurerm_public_ip" "pip-jenkins" {
  name = var.pip_name
  resource_group_name = azurerm_resource_group.rg-jenkins.name
  location = azurerm_resource_group.rg-jenkins.location
  allocation_method = var.pip_allocation_method
  tags = {
    "pipJ-Ana" = "SanMartin"
  }
}

resource "azurerm_virtual_network" "vnet-jenkins" {
  name = var.vnet_name
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.rg-jenkins.location
  resource_group_name = azurerm_resource_group.rg-jenkins.name  
}

resource "azurerm_subnet" "subnet-jenkins" {
  name = var.subnet_name
  resource_group_name = azurerm_resource_group.rg-jenkins.name
  virtual_network_name = azurerm_virtual_network.vnet-jenkins.name
  address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "netinter-jenkins" {
  name = var.netinter_name
  location = azurerm_resource_group.rg-jenkins.location
  resource_group_name = azurerm_resource_group.rg-jenkins.name
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.subnet-jenkins.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip-jenkins.id
  }  
}

resource "azurerm_linux_virtual_machine" "vm-jenkins" {
  name = var.vm_name
  resource_group_name = azurerm_resource_group.rg-jenkins.name
  location = azurerm_resource_group.rg-jenkins.location
  size = "Standard_B1s"
  network_interface_ids = [ azurerm_network_interface.netinter-jenkins.id ]
  source_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "16.04-LTS"
    version = "latest"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  computer_name = "hostname"
  admin_password = var.vm_password
  admin_username = var.vm_username
  disable_password_authentication = false
}