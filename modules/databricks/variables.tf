variable "resource_group" {
  type        = string
  description = "Workspace resource group name for databricks"
}

variable "prefix" {
  type        = string
  description = "Prefix for databricks workspace and managed resource group"
}
variable "tags" {
  type        = map(string)
  description = "Tags for databricks workspace"
}
