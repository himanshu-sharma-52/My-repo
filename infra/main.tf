module "resource" {
  source   = "../modules/azurerm_resource_group"
  rg_name  = "todu-rg-52"
  location = "centralindia"
}

module "vnet" {
  depends_on    = [module.resource]
  source        = "../modules/azurerm_vnet"
  vnet_name     = "todu-vnet52"
  location      = "centralindia"
  rg_name       = "todu-rg-52"
  address_space = ["10.0.0.0/16"]
}

module "frontend_subnet" {
  depends_on       = [module.resource, module.vnet]
  source           = "../modules/azurerm_subnet"
  subnet_name      = "frontend-subnet52"
  vnet_name        = "todu-vnet52"
  rg_name          = "todu-rg-52"
  address_prefixes = ["10.0.1.0/24"]

}

module "nsg" {
  depends_on = [module.frontend_subnet]
  source     = "../modules/azurerm_nsg"
  nsg_name   = "nsg-rule52"
  location   = "centralindia"
  rg_name    = "todu-rg-52"
}



module "nsg_association" {
  depends_on = [module.frontend_subnet, module.nsg]
  source     = "../modules/azurerm_nsg_association"

  subnet_name = "frontend-subnet52"
  vnet_name   = "todu-vnet52"
  rg_name     = "todu-rg-52"
  nsg_name    = "nsg-rule52"
}

module "pip" {
  depends_on = [ module.frontend_subnet, module.vnet, ]
  source   = "../modules/azurerm_pip"
  pip_name = "frontend-pip-52"
  location = "centralindia"
  rg_name  = "todu-rg-52"
  allocation_method = "Dynamic"
  sku               = "Basic"
}