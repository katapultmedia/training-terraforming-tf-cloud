resource "tfe_workspace" "training" {
  name         = "tf-cloud-training-local"
  organization = local.org_name

  operations        = false # state storage only
  terraform_version = "0.12.18"
}

resource "tfe_team_access" "training" {
  access       = "read"
  team_id      = tfe_team.training.id
  workspace_id = tfe_workspace.training.id
}

resource "tfe_variable" "account_id" {
  key          = "account_id"
  value        = "abc123"
  category     = "terraform"
  workspace_id = tfe_workspace.training.id
}

resource "tfe_variable" "new_relic_token" {
  key          = "new_relic_token"
  value        = "def456"
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.training.id
}
