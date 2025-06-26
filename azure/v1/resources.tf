// Define the resources to create
// Provisions the following into Azure:
//    Virtual Network, Subnet, Virtual Machine, Storage Account
resource "azurerm_resource_group" "main" {
  name     = "main-rg"
  location = "East US 2"
}

resource "azurerm_virtual_network" "main" {
  name                = "main-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = {
    Name = "main"
  }
}

resource "azurerm_subnet" "main" {
  name                 = "main-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "vm-be" {
  count               = 3
  name                = "vm-be-nic-${count.index}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    name  = "vm-be-${count.index}"
    extra = var.extra
  }
}

resource "azurerm_linux_virtual_machine" "vm-be" {
  count               = 3
  name                = "vm-be-${count.index}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = var.instance_type
  admin_username      = "adminuser"
  admin_password      = "Harness1!"
  network_interface_ids = [
    azurerm_network_interface.vm-be[count.index].id,
  ]

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = {
    name  = "vm-be-${count.index}"
    extra = var.extra
  }
}
