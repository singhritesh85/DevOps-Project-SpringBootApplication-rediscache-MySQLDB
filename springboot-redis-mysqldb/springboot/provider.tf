provider "azurerm" {
  subscription_id = "5XXXXXXXX6-aXXX-XXXX-9XX4-XXXXXXXXXXXd"
  tenant_id = "XXXXXXX9-XXXX-XXXX-XXX9-bXXXXXXXXXXXf"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true    ### All the Resources within the Resource Group must be deleted before deleting the Resource Group.
    }
  }
}
