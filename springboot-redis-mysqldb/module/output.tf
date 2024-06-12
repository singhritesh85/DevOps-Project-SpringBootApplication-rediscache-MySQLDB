################################################## Output for Azure VM #####################################################

output "public_ip_address" {
  description = "Public IP address of created Azure VM"
  value = azurerm_linux_virtual_machine.azure_vm.*.public_ip_address
}

output "id_of_created_azure_vm" {
  description = "Id of the created Azure VM"
  value = azurerm_linux_virtual_machine.azure_vm.*.id
}

########################################### Output for Azure MySQL Flexible Servers ########################################

output "db_hostname" {
  description = "Database instance fully qualified domain name."
  value       = azurerm_mysql_flexible_server.azure_mysql.fqdn
}

output "db_server_name" {
  description = "Database instance hostname."
  value       = azurerm_mysql_flexible_server.azure_mysql.name
}

output "db_username" {
  description = "Database instance master username."
  value       = azurerm_mysql_flexible_server.azure_mysql.administrator_login
  sensitive   = true
}

################################################# Output for Redis ##########################################################

output "redis_hostname" {
  value       = azurerm_redis_cache.azure_redis.hostname
  description = "Redis instance hostname"
}

output "redis_name" {
  value       = azurerm_redis_cache.azure_redis.name
  description = "Redis instance name"
}

#output "redis_primary_access_key" {
#  sensitive   = true
#  value       = azurerm_redis_cache.azure_redis.primary_access_key
#  description = "Redis primary access key"
#}

#output "redis_secondary_access_key" {
#  sensitive   = true
#  value       = azurerm_redis_cache.azure_redis.secondary_access_key
#  description = "Redis secondary access key"
#}

#output "redis_primary_connection_string" {
#  description = "The primary connection string of the Redis Instance."
#  value       = azurerm_redis_cache.azure_redis.primary_connection_string
#  sensitive   = true
#}

#output "redis_secondary_connection_string" {
#  description = "The secondary connection string of the Redis Instance."
#  value       = azurerm_redis_cache.azure_redis.secondary_connection_string
#  sensitive   = true
#}
