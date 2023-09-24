resource "azurerm_notification_hub_namespace" "nh" {
  count               = var.nh_notification_hub_create ? 1 : 0

  resource_group_name = var.rg_resource_group_name
  location            = var.rg_location

  name                = format("%s", var.nh_notification_hub_namespace_name)
  namespace_type      = "NotificationHub"

  sku_name            = var.nh_sku_name

  tags     = merge({ "ResourceName" = format("%s", var.nh_notification_hub_namespace_name) }, var.tags, )
}

resource "azurerm_notification_hub" "nh" {
  count               = var.nh_notification_hub_create ? 1 : 0

  name                = format("%s", var.nh_notification_hub_name)
  namespace_name      = azurerm_notification_hub_namespace.nh[count.index].name
  resource_group_name = var.rg_resource_group_name
  location            = var.rg_location

  apns_credential {
    application_mode = var.nh_apns_credential.application_mode
    bundle_id        = var.nh_apns_credential.bundle_id
    key_id           = var.nh_apns_credential.key_id
    team_id          = var.nh_apns_credential.team_id
    token            = var.nh_apns_credential.token
  }

  gcm_credential  {
    api_key = var.nh_gcm_credential.api_key
  }

  tags     = merge({ "ResourceName" = format("%s", var.nh_notification_hub_name) }, var.tags, )
}


resource "azurerm_notification_hub_authorization_rule" "nh" {
  count                 = var.nh_notification_hub_create ? 1 : 0

  name                  = format("%s", var.nh_notification_hub_authrule_name)
  notification_hub_name = azurerm_notification_hub.nh[count.index].name
  namespace_name        = azurerm_notification_hub_namespace.nh[count.index].name
  resource_group_name   = var.rg_resource_group_name
  manage                = var.nh_manage
  send                  = var.nh_send
  listen                = var.nh_listen
}
