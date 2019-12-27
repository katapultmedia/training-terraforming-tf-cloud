resource "tfe_workspace" "training_remote" {
  name         = "tf-cloud-training-remote"
  organization = local.org_name

  operations        = true # full access
  terraform_version = "0.12.18"
}

resource "tfe_team_access" "training_remote" {
  access       = "read"
  team_id      = tfe_team.training.id
  workspace_id = tfe_workspace.training_remote.id
}

resource "tfe_variable" "training_remote_account_id" {
  key          = "account_id"
  value        = "ghi789"
  category     = "terraform"
  workspace_id = tfe_workspace.training_remote.id
}

resource "tfe_variable" "training_remote_new_relic_token" {
  key          = "new_relic_token"
  value        = "jkl101"
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.training_remote.id
}
