resource "azuread_application_registration" "oidc" {
  display_name = coalesce(var.application_name, var.github_repository)
  description  = "OIDC for ${var.github_repository} GitHub repository."
}

resource "azuread_application_federated_identity_credential" "oidc" {
  for_each = toset(local.subjects)

  application_id = azuread_application_registration.oidc.id
  display_name = replace(
    replace(each.value, "ref:refs/tags/", "tag_"),
    "ref:refs/heads/", "branch_"
  )
  description = "GitHub OIDC for ${var.github_repository}."
  audiences   = ["api://AzureADTokenExchange"]
  issuer      = "https://token.actions.githubusercontent.com"
  subject     = "repo:${var.github_repository}:${each.value}"
}

resource "azuread_service_principal" "oidc" {
  client_id = azuread_application_registration.oidc.client_id
  owners    = [var.owner_id]
}
