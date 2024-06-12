############################################## Creation for NSG #######################################################

resource "azurerm_network_security_group" "azure_nsg" {
  count               = var.vm_count
  name                = "${var.prefix}-nsg-${count.index + 1}"
  location            = azurerm_resource_group.azure_resource_group.location
  resource_group_name = azurerm_resource_group.azure_resource_group.name

  security_rule {
    name                       = "azure_nsg1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "azure_nsg"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = var.env
  }
}

########################################## Create Public IP and Network Interface #############################################

resource "azurerm_public_ip" "public_ip" {
  count               = var.vm_count
  name                = "${var.prefix}-ip-${count.index + 1}"
  resource_group_name = azurerm_resource_group.azure_resource_group.name
  location            = azurerm_resource_group.azure_resource_group.location
  allocation_method   = var.static_dynamic[0]

  sku = "Standard"   ### Basic, For Availability Zone to be Enabled the SKU of Public IP must be Standard  
  zones = var.availability_zone

  tags = {
    environment = var.env
  }
}

resource "azurerm_network_interface" "vnet_interface" {
  count               = var.vm_count
  name                = "${var.prefix}-nic-${count.index + 1}"
  location            = azurerm_resource_group.azure_resource_group.location
  resource_group_name = azurerm_resource_group.azure_resource_group.name

  ip_configuration {
    name                          = "${var.prefix}-ip-configuration-${count.index + 1}"
    subnet_id                     = azurerm_subnet.vmss_subnet.id
    private_ip_address_allocation = var.static_dynamic[1]
    public_ip_address_id = azurerm_public_ip.public_ip[count.index].id
  }
  
  tags = {
    environment = var.env
  }
}

############################################ Attach NSG to Network Interface #####################################################

resource "azurerm_network_interface_security_group_association" "nsg_nic" {
  count                     = var.vm_count
  network_interface_id      = azurerm_network_interface.vnet_interface[count.index].id
  network_security_group_id = azurerm_network_security_group.azure_nsg[count.index].id

}

######################################################## Create Azure VM ##########################################################

resource "azurerm_linux_virtual_machine" "azure_vm" {
  count                 = var.vm_count
  name                  = "${var.prefix}-vm-${count.index + 1}"
  location              = azurerm_resource_group.azure_resource_group.location
  resource_group_name   = azurerm_resource_group.azure_resource_group.name
  network_interface_ids = [azurerm_network_interface.vnet_interface[count.index].id]
  size                  = var.vm_size
  zone                 = var.availability_zone[0]
  computer_name  = "${var.computer_name}-${count.index + 1}"
  admin_username = var.admin_username
  admin_password = var.admin_password
  custom_data    = filebase64("custom_data.sh")
  disable_password_authentication = false

  #### Boot Diagnostics is Enable with managed storage account ########
  boot_diagnostics {
    storage_account_uri  = ""
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7_9-gen2"
    version   = "latest"
  }
  os_disk {
    name              = "${var.prefix}-osdisk-${count.index + 1}"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb      = var.disk_size_gb
  }

  tags = {
    environment = var.env
  }
}

resource "azurerm_managed_disk" "disk" {
  count                = var.vm_count
  name                 = "${var.prefix}-datadisk-${count.index + 1}"
  location             = azurerm_resource_group.azure_resource_group.location
  resource_group_name  = azurerm_resource_group.azure_resource_group.name
  zone                 = var.availability_zone[0]
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.extra_disk_size_gb
}


resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  count              = var.vm_count
  managed_disk_id    = azurerm_managed_disk.disk[count.index].id
  virtual_machine_id = azurerm_linux_virtual_machine.azure_vm[count.index].id
  lun                ="0"
  caching            = "ReadWrite"
}  
