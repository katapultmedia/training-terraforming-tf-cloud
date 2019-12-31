data "terraform_remote_state" "local" {
  backend = "remote"

  config = {
    organization = "katapultmediainc"

    workspaces = {
      name = "tf-cloud-training-local"
    }
  }
}

output "account_id" {
  value = data.terraform_remote_state.local.outputs.account_id
}

output "new_relic_token" {
  value = data.terraform_remote_state.local.outputs.new_relic_token
}
