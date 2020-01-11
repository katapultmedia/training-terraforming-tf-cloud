data "terraform_remote_state" "local" {
  backend = "remote"

  config = {
    organization = "katapultmediainc"

    workspaces = {
      name = "tf-cloud-training-remote"
    }
  }
}

output "arn" {
  value = data.terraform_remote_state.local.outputs.arn
}

output "id" {
  value = data.terraform_remote_state.local.outputs.id
}

output "account_id" {
  value = data.terraform_remote_state.local.outputs.account_id
}
