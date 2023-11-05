resource "azurerm_storage_account" "sa" {
  name                     = "${var.base_name}${var.sa_name}${random_string.random_string.result}${local.workspace_suffix}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sc" {
  name                  = "${var.base_name}${var.sc_name}${local.workspace_suffix}"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}