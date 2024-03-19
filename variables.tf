variable "azure_region" {
  description = "The Azure region where to create infra"
  default     = "East US"
}

variable "base_name" {
  description  = "A string for the lbase name of the resource."
  type         = string
  default      = "cmtr"
}

variable "address_space" {
  type        = string
  description = "Cidr range for the Virtual Network"
  default     = "10.10.0.0/16"
}

variable "custom_identifier" {
  description  = "A string for the lbase name of the resource."
  type         = string
  default      = "abbfbsf"
}

variable "subnet1" {
  description  = "A string for the lbase name of the resource."
  type         = string
  default      = "private"
}

variable "subnet2" {
  description  = "A string for the lbase name of the resource."
  type         = string
  default      = "public"
}