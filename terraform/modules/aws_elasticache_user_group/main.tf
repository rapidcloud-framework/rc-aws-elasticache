resource "aws_elasticache_user_group" "main" {
  user_group_id = var.user_group_id
  user_ids      = concat(var.user_ids, ["default"])
  engine        = "REDIS"
  tags          = var.tags
}