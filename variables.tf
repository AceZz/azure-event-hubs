variable "environment" {
  type        = string
  description = "name of the environment (e.g. demo, dev, test, prod)"
}

variable "owner" {
  type        = string
  description = "owner of the resource group and databricks workspace"
}

variable "region" {
  type        = string
  description = "Azure region for the services"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription id to use for the services"
}
