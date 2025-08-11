resource "random_string" "secret_name_suffix" {
  length  = 6
  special = false
}

resource "aws_secretsmanager_secret" "app_secret" {
  name        = "${var.secret_name}-${random_string.secret_name_suffix.result}"
  description = var.secret_description
  tags = {
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "app_secret_version" {
  secret_id     = aws_secretsmanager_secret.app_secret.id
  secret_string = var.secret_value
}
