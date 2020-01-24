# Define the Azure Provide
provider "azurerm" {
  version = "~>1.32.0"
  subscription_id = ""
  tenant_id = ""
}

# Create a resource group for our Cosmos Account
resource "azurerm_resource_group" "rg" {
  name = "${var.resource_group_name}"
  location = "${var.location}"

  tags = {
      environment = "Demo Sandbox"
  }
}

# Create a Cosmos DB account
resource "azurerm_cosmosdb_account" "db" {
  name = "${var.cosmosdb_account_name}"
  location = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  offer_type = "Standard"
  kind = "GlobalDocumentDB"

  enable_automatic_failover = false

  consistency_policy {
      consistency_level = "Session"
  }


}










