## notification hub
output "nh_servicebus_endpoint" {
  description = "The URL that can be used to log into the container registry."
  value       = var.nh_notification_hub_create ? element(concat(azurerm_notification_hub_namespace.nh[*].servicebus_endpoint, tolist([""])), 0) : 0
}
