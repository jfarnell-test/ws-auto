# TFE_HOSTNAME
# TFE_TOKEN
provider "tfe" {}

# Create a new TFE Organization for testing
# resource "random_pet" "org_name" {}

/* resource "tfe_organization" "org" {
  name  = random_pet.org_name.id
  email = format("%s@email.com", random_pet.org_name.id)
} */

# Create an "admin" team
resource "tfe_team" "admin" {
  organization = "my-org"
  name         = "admin-team"
}

# Create an "dev" team
resource "tfe_team" "dev" {
  organization = "my-org"
  name         = "dev-team"
}

output "tfe" {
  value = {
    organization_name = "my-org"
    teams = {
      admin = tfe_team.admin.id
      dev   = tfe_team.dev.id
    }
  }
}