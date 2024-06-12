######################################################## Redis Cache #######################################################

### The name used for Azure Redis should be globally unique
resource "azurerm_redis_cache" "azure_redis" {
  name                = "${var.prefix}azureredis"
  location            = azurerm_resource_group.azure_resource_group.location
  resource_group_name = azurerm_resource_group.azure_resource_group.name
  capacity            = 0               ### For C(Basic/Standard) valid values are 0, 1, 2, 3, 4, 5, 6 and For P(For Premium) valid values are 1, 2, 3, 4, 5 
  family              = "C"             ### C(For Basic/Standard), P(For Premium)
  sku_name            = "Basic"         ###"Standard", "Premium"
  enable_non_ssl_port = true           ### For Non-SSL Port 6379 is used and For SSL Port 6380 will be used
  minimum_tls_version = "1.2"
  public_network_access_enabled = true  ### Default value is true
  redis_version       = "6"             ### Valid values are 4 and 6. Latest version is 6.

  redis_configuration {
    enable_authentication = true        ### If this value is set to false, then Redis Instance can be accessible without Authentication
    active_directory_authentication_enabled = false      ### Used for enabling Microsoft Entra Authentication
    maxmemory_policy = "volatile-lru"   ### It removes least recently used cache entry, when maxmemory is reached
    rdb_backup_enabled = false          ### Do you want to enable Backup, Supported only for Premium SKUs
    rdb_storage_connection_string = ""   ### Only Supported for Premium SKU, Provide Connection String to Storage Account
#    storage_account_subscription_id = "" ### Provide ID of the Subscription whcih contain the Storage Account.
  }
}
