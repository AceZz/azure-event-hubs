data "azurerm_resource_group" "this" {
  name = var.resource_group
}

resource "azurerm_databricks_workspace" "this" {
  name                        = "${var.prefix}-workspace"
  resource_group_name         = data.azurerm_resource_group.this.name
  location                    = data.azurerm_resource_group.this.location
  sku                         = "premium"
  managed_resource_group_name = "${var.prefix}-workspace-rg"
  tags                        = var.tags
}
