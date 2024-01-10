resource "aws_elasticache_user" "main" {
  user_id       = var.user_id
  user_name     = var.user_name
  access_string = var.access_string
  engine        = "REDIS"

  authentication_mode {
    type = "iam"
  }
}