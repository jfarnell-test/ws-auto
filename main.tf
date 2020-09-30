#TFE_HOSTNAME
#TFE_TOKEN

provider "tfe" {}

#new module call for each workspace set

module "workspace" {
  source = "./modules/workspaces"

  organization_name = var.organization_name
  names             = ["workspace_a_tf12-1", "workspace_a_tf12-2", "workspace_a_tf12-3"]
  team_names = ["admin", "dev"]
  teams_access = [
    {
      id     = var.team_admin
      access = "admin"
    },
    {
      id     = var.team_dev
      access = "plan"
    }
  ]
}




