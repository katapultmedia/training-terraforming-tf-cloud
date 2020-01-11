variable "account_id" {}

output "account_id" {
  value = var.account_id
}

resource "aws_ecs_cluster" "tfc_training" {
  name = "training"
}
