output "app_url" {
  description = "Public URL of the deployed app"
  value       = "https://${azurerm_linux_web_app.main.default_hostname}"
}