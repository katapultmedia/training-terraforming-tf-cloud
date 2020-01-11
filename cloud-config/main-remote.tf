resource "tfe_workspace" "training_remote" {
  name         = "tf-cloud-training-remote"
  organization = local.org_name

  operations        = true # full access
  terraform_version = "0.12.19"
}

resource "tfe_team_access" "training_remote" {
  access       = "plan"
  team_id      = tfe_team.training.id
  workspace_id = tfe_workspace.training_remote.id
}

resource "tfe_variable" "remote_account_id" {
  key          = "account_id"
  value        = "ghi789"
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.training_remote.id
}

resource "tfe_variable" "region" {
  key          = "AWS_DEFAULT_REGION"
  value        = "us-east-1"
  category     = "env"
  workspace_id = tfe_workspace.training_remote.id
}

resource "tfe_variable" "access_key" {
  key          = "AWS_ACCESS_KEY"
  value        = var.access_key
  category     = "env"
  workspace_id = tfe_workspace.training_remote.id
}

resource "tfe_variable" "secret_key" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.secret_key
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.training_remote.id
}
