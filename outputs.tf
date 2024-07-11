output "client_id" {
  value       = azuread_application_registration.oidc.client_id
  description = "Azure AD application client_id."
  sensitive   = false
}

output "service_principal" {
  value       = azuread_service_principal.oidc
  description = "Service Principal object associated with the application."
  sensitive   = false
}
