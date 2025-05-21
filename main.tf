resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

# my resource group
resource "azurerm_resource_group" "rg" {
  name = random_pet.rg_name.id
  location = var.resource_group_location
}

#azure web plan
resource "azurerm_service_plan" "my_web_plan" {
  name = var.function_app_plan
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name = "B1"
  os_type = "Linux"
}

#web app
resource "azurerm_linux_web_app" "my_web_app" {
  name = var.web_app_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id = azurerm_service_plan.my_web_plan.id

  site_config {
    application_stack {
      node_version = "22-lts"
    }
  }

  identity {
    type = "SystemAssigned"
  }
}
