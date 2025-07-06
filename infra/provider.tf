terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.35.0"
    }
  } 
    backend  "azurerm" {
      resource_group_name =  "backend52"
      storage_account_name = "mystoragebkend52"
      container_name       =  "backendcontainer-52"
      key                  =   "statefile52"
      subscription_id = "68091150-801e-4498-8be2-e5d4bcf9919c"

    }
  
}


provider "azurerm" {
  features {}
  subscription_id = "68091150-801e-4498-8be2-e5d4bcf9919c"

}



