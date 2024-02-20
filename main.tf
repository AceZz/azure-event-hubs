terraform {
  required_providers {
    azurerm = "~> 3.80"
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

data "azurerm_client_config" "current" {
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

locals {
  prefix = "dbeventshubdemo${random_string.naming.result}"
  tags = {
    Environment = var.environment
    Owner       = var.owner
  }
}

resource "azurerm_resource_group" "this" {
  name     = "${local.prefix}-rg"
  location = var.region
  tags     = local.tags
}

module "databricks" {
  resource_group = azurerm_resource_group.this.name
  source         = "./modules/databricks"
  prefix         = local.prefix
  tags           = local.tags
}
