## naming
variable "department" {
  description = "Specifies the name of the department."
  type        = list(string)
  default     = []
}

variable "projectname" {
  description = "Specifies the name of the project."
  type        = list(string)
  default     = []
}

variable "environment" {
  description = "Specifies the name of the environment."
  type        = list(string)
  default     = []
}

variable "region_mapping" {
  description = "Specifies the name of the region."
  type        = list(string)
  default     = []
}

## resource group
variable "rg_resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
  default     = null
}

variable "rg_location" {
  description = "Specifies the supported Azure location where the resource should be created."
  type        = string
  default     = null
}

## notification hub
variable "nh_notification_hub_create" {
  description = "Controls if notification hub should be created."
  type        = bool
}

variable "nh_notification_hub_namespace_name" {
  description = "(Required) The name of the Notification Hub Namespace in which to create this Notification Hub. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "nh_notification_hub_name" {
  description = "(Required) The name to use for this Notification Hub. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "nh_sku_name" {
  description = "The SKU name of the notification hub."
  type        = string
  default     = null
}

variable "nh_apns_credential" {
  description = ""
  type = object({
    application_mode = string
    bundle_id        = string
    key_id           = string
    team_id          = string
    token            = string
  })
}

variable "nh_gcm_credential" {
  description = ""
  type = object({
    api_key = string
  })
}

variable "nh_notification_hub_authrule_name" {
  description = "(Required) The name to use for this Authorization Rule. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "nh_manage" {
  description = "(Optional) Does this Authorization Rule have Manage access to the Notification Hub? Defaults to false."
  type        = bool
}

variable "nh_send" {
  description = "(Optional) Does this Authorization Rule have Send access to the Notification Hub? Defaults to false."
  type        = bool
}

variable "nh_listen" {
  description = "(Optional) Does this Authorization Rule have Listen access to the Notification Hub? Defaults to false."
  type        = bool
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
