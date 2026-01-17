resource "random_password" "user_password" {
  length  = 16
  special = true
}

resource "azuread_user" "user" {
  user_principal_name   = "user01@${data.azuread_domains.default.domains[0].domain_name}"
  display_name          = "user01 user"
  password              = random_password.user_password.result
  force_password_change = false
}

resource "azuread_directory_role" "user_role" {
  display_name = "Global Reader"
}

resource "azuread_directory_role_assignment" "user_role_member" {
  role_id             = azuread_directory_role.user_role.object_id
  principal_object_id = azuread_user.user.object_id
}