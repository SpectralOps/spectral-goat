resource "azurerm_resource_group" "example" {
  name     = "acceptanceTestResourceGroup1"
  location = "West US"
}


resource "azurerm_storage_account" "example" {
  name                     = "accteststorageaccount"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "accteststoragecontainer"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

resource "azurerm_mssql_server_security_alert_policy" "example" {
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.example.name
  state               = "Enabled"
}

resource "azurerm_sql_database" "example" {
  name                = "mysqldatabase"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.example.name
  location            = azurerm_resource_group.example.location
  edition             = "Standard"
}

resource "azurerm_mssql_server_vulnerability_assessment" "example" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.example.id
  storage_container_path          = "${azurerm_storage_account.example.primary_blob_endpoint}${azurerm_storage_container.example.name}/"
  storage_account_access_key      = azurerm_storage_account.example.primary_access_key
}

resource "azurerm_mssql_database_vulnerability_assessment_rule_baseline" "example" {
  server_vulnerability_assessment_id = azurerm_mssql_server_vulnerability_assessment.example.id
  database_name                      = azurerm_sql_database.example.name
  rule_id                            = "VA2065"
  baseline_name                      = "master"
  baseline_result {
    result = [
      "allowedip1",
      "123.123.123.123",
      "123.123.123.123"
    ]
  }
  baseline_result {
    result = [
      "allowedip2",
      "255.255.255.255",
      "255.255.255.255"
    ]
  }
}
