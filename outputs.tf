output "application" {
  value       = azuread_application_registration.oidc
  description = "Azure AD application object."
  sensitive   = false
}

output "service_principal" {
  value       = azuread_service_principal.oidc
  description = "Service Principal object associated with the application."
  sensitive   = false
}
