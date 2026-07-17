variable "resource_group_name" {
  description = "Name of the main resource group"
  default     = "demo-api-rg"
}

variable "location" {
  description = "Azure region"
  default     = "Spain Central"
}

variable "app_name" {
  description = "App Service name"
}

variable "github_username" {
  description = "GitHub username (lowercase)"
}

variable "repo_name" {
  description = "GitHub repo name"
}