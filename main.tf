#TFE_HOSTNAME
#TFE_TOKEN

provider "tfe" {}


# Team creation
resource "tfe_team" "team" {
  for_each     = toset(var.team_names)
  organization = "my-org"
  name         = each.key
}

#new module call for each workspace set

module "workspace" {
  source            = "./modules/workspaces"
  depends_on        = [tfe_team.team]
  organization_name = var.organization_name
  names             = ["workspace_a_tf12-1", "workspace_a_tf12-2", "workspace_a_tf12-3"]
  team_names        = ["admin", "dev"]
  teams_access = [
    {
      id     = tfe_team[0].id #var.team_admin
      access = "admin"
    },
    {
      id     = tfe_team[1].id #var.team_dev
      access = "plan"
    }
  ]
}




