resource "azurerm_resource_group" "rg" {
  name     = "assignment3-rg"
  location = "Australia East"
}

resource "azurerm_service_plan" "plan" {
  name                = "assignment3-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  os_type  = "Linux"
  sku_name = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "assignment3smf"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  service_plan_id = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      python_version = "3.12"
    }
  }
}
resource "azurerm_application_insights" "appi" {
  name                = "assignment3-appinsights"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  application_type = "web"
}

