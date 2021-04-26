# ==================================================
# Terraform & Providers
# ==================================================
terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.45.1"
    }
  }
}

# ==================================================
# Variables 
# ==================================================
variable "resource_group" { }
variable "location" { }
variable "application_insights_name" {}

variable tags {
  type        = map
  description = "Collection of the tags referenced by the Azure deployment"
  default = {
    source      = "terraform"
    environment = "dev"
    costCenter  = ""
  }
}

# ==================================================
# Resources
# ==================================================

resource "azurerm_application_insights" "core_ai" {
  name                = var.application_insights_name
  location            = var.location
  resource_group_name = var.resource_group
  application_type    = "web" # ios/java/MobileCenter/Node.JS/other/phone/store/web
  #daily_data_cap_in_gb = 100
  #daily_data_cap_notifications_disabled = false
  # retention_in_days = 42 #30/60/90/120/180/270/365/550/730
  # sampling_percentage = 
  # disable_ip_masking = 
  tags = var.tags
  depends_on = []
}

# ==================================================
# Output
# ==================================================
output "instrumentation_key" {
  value = azurerm_application_insights.core_ai.instrumentation_key
}




#+=======================================================================================
# App Insights - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/app_service
#---------------------------------------------------------------------------------------
# id - The ID of the Application Insights component.
# app_id - The App ID associated with this Application Insights component.
# instrumentation_key - The Instrumentation Key for this Application Insights component.
# connection_string - The Connection String for this Application Insights component. (Sensitive)
#+=======================================================================================



#+=======================================================================================
# Data - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/app_service
#----------------------------------------------------------------------------------------
# id - The ID of the Virtual Machine.
# app_id - The App ID associated with this Application Insights component.
# application_type - The type of the component.
# instrumentation_key - The instrumentation key of the Application Insights component.
# connection_string - The connection string of the Application Insights component. (Sensitive)
# location - The Azure location where the component exists.
# retention_in_days - The retention period in days.
# tags - Tags applied to the component.
#+=======================================================================================

# data "azurerm_application_insights" "core_ai" {
#   name                = var.common.application_insights.name
#   resource_group_name = var.common.resource_group
# }


#+=======================================================================================
# Output
# ---------------------------------------------------------------------------------------
# id - The ID of the Virtual Machine.
# app_id - The App ID associated with this Application Insights component.
# application_type - The type of the component.
# instrumentation_key - The instrumentation key of the Application Insights component.
# connection_string - The connection string of the Application Insights component. (Sensitive)
# location - The Azure location where the component exists.
# retention_in_days - The retention period in days.
# tags - Tags applied to the component.
#+=======================================================================================
