resource "azurerm_network_interface" "nic" {
    name = var.nic_name
  location =  var.location
  resource_group_name =  var.rg_name

  ip_configuration {
    name = "internal"
    public_ip_address_id = data.azurerm_public_ip.pip.id
    subnet_id =  data.azurerm.subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# resource "azurerm_linux_virtual_machine" "linux_vm" {
#     name = var.vm_name
#   location =  var.location
#   resource_group_name =  var.rg_name
# }