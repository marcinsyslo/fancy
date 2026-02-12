variable "vpc_name" {
  description = "VPC_NAME"
  type        = string
}

variable "dns_zone_id" {
  description = "SKU_NAME"
  type        = string
}

variable "db_sku_name" {
  description = "SKU_NAME"
  type        = string
}

variable "db_instance_class" {
  description = "DB_TYPE"
  type        = string
}

variable "environment" {
  description = "ENV"
  type        = string
}

variable "db_name" {
  description = "DB_NAME"
  type        = string
}

variable "vnet_name" {
  type = string
}

variable "network_rg_name" {
  type = string
}

variable "location" {
  type = string
  default = "westeurope"
}

variable "resource_group_name" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}