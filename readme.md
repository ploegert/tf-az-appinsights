
# terraform-azure-functions
The purpose of this repo is to provide a base terraform modules for deploying azure resource group. 

## Example Invocation:
Calling function:

```terraform
module "app_insights" {
  source = "github.com/ploegert/tf-az-appinsights"

  providers = {
    azurerm = azurerm
  }
  application_insights_name = local.workspace["appinsights_name"]
  resource_group            = module.shared_rg.rg_name
  location                  = local.workspace["location"]
  tags                      = local.workspace["tags"]

  depends_on = [
    module.shared_rg
  ]
```