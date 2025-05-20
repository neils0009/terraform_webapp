variable "resource_group_location" {
  type        = string
  default     = "australiasoutheast"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "neil009_tf"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "function_app_plan" {
  type = string
  default = "webapp_uploadshare_plan"
  description = "The web app plan"
}

variable "function_app_name" {
  type = string
  default = "app_uploadshare_009"
  description = "The web app name"
}