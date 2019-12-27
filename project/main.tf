variable "account_id" {}
variable "new_relic_token" {}

output "account_id" {
  value = var.account_id
}

output "new_relic_token" {
  value = var.new_relic_token
}
