output "id" {
  description = "The Amazon Resource Name (ARN) that identifies the cluster"
  value = aws_ecs_cluster.tfc_training.id
}

output "arn" {
  description = "The Amazon Resource Name (ARN) that identifies the cluster"
  value = aws_ecs_cluster.tfc_training.arn
}
